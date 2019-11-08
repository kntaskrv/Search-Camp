# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :wish do
    child
    season
    friend { FactoryBot.create(:child) }
    accepted { false }

    trait :accepted do
      accepted { true }
    end
  end
end
