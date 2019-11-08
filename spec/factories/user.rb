# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: 6) }
    birthday { Date.current + rand(1..27).days }
  end
end
