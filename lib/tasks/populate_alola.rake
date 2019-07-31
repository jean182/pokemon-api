# frozen_string_literal: true

desc "Add pokemon from the Alola region"
task populate_alola_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(722, 809).populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
