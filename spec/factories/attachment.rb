# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :attachment do
    season
    image { Faker::File.dir }
  end
end
