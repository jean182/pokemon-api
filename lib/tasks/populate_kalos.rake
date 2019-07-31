# frozen_string_literal: true

desc "Add pokemon from the Kalos region"
task populate_kalos_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(650, 721).populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
