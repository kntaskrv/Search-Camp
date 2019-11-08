# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :event do
    name { Faker::Book.title }
    location { Faker::WorldCup.city }
    date { Date.current + rand(1..27).days }
  end
end
