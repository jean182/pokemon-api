# frozen_string_literal: true

desc "Add pokemon from the Sinnoh region"
task populate_sinnoh_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(387, 493, "Sinnoh").populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
