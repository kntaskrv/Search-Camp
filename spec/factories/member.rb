# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :member do
    user
    event
  end
end
