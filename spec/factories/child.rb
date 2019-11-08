# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :child do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: 6) }
    birthday { Date.current + rand(1..27).days }
  end

  factory :same_child, class: 'Child' do
    name { 'Petya' }
    email { 'petya@gmail.com' }
    password { 123_456 }
    birthday { Date.current }
  end
end
