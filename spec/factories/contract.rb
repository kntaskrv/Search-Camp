# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :contract do
    adult
    season
    salary { Faker::Number.number(digits: 5) }
  end
end
