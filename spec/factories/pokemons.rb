# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    pokedex_number { rand(1..809) }
    pokedex_entry { Faker::Lorem.paragraph }
    height { Faker::Measurement.height }
    weight { Faker::Measurement.weight }
    region
  end
end
