# frozen_string_literal: true

class Wish < ApplicationRecord
  validates :child, uniqueness: { scope: %i[friend season] }

  belongs_to :child, foreign_key: :user_id
  belongs_to :friend, class_name: 'Child'
  belongs_to :season, foreign_key: :season_id
end
