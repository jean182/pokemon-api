# frozen_string_literal: true

desc "Add pokemon from Hoenn region"
task populate_hoenn_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(252, 386, "Hoenn").populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
