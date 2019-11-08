# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, :location, :date, presence: true

  has_many :seasons_events, dependent: :destroy
  has_many :seasons, through: :seasons_events

  has_many :members, dependent: :destroy
  has_many :users, through: :members
end
