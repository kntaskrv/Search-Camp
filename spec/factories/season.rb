# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :season do
    name { Faker::Book.title }
    location { Faker::WorldCup.city }
    date_start { Date.current + rand(1..27).days }
    date_end { Date.current + rand(1..27).days }
  end
end
