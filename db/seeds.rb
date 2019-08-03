# frozen_string_literal: true

tasks = %i[
  populate_kanto_pokemon
  populate_johto_pokemon
  populate_hoenn_pokemon
  populate_sinnoh_pokemon
  populate_unova_pokemon
  populate_kalos_pokemon
  populate_alola_pokemon
]

start_time = Time.now
tasks.each do |task|
  Rake::Task[task].invoke
end
time_diff = Time.at(Time.now - start_time).utc.strftime("%T")
puts "\nProcess finished in #{time_diff}."
