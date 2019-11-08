# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment do
    user
    season
    message { Faker::Lorem.sentence }
  end
end
