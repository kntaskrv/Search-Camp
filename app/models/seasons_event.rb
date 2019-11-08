# frozen_string_literal: true

class SeasonsEvent < ApplicationRecord
  validates :season, uniqueness: { scope: :event }

  belongs_to :season
  belongs_to :event
end
