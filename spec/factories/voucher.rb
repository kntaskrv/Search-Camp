# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :voucher do
    child
    season
    class_num { 5 }
  end
end
