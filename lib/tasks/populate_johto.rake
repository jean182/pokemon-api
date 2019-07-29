# frozen_string_literal: true

desc "Add pokemon from the Johto region"
task populate_johto_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(152, 251).populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
