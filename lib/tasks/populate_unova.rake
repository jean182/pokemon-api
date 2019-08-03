# frozen_string_literal: true

desc "Add pokemon from the Unova region"
task populate_unova_pokemon: :environment do
  start_time = Time.now
  PopulatePokemon::Service.new(494, 649, "Unova").populate
  time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
  puts "\nProcess finished in #{time_diff}."
end
