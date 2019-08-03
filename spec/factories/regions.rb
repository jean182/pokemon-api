# frozen_string_literal: true

FactoryBot.define do
  factory :region do
    name { Faker::Games::Pokemon.location }
    description { Faker::Lorem.paragraph }
  end
end
