# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :seasons_event do
    season
    event
  end
end
