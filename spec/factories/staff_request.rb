# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :staff_request do
    user
    season
  end
end
