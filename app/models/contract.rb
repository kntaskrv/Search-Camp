# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :salary, presence: true
  validates :user_id, uniqueness: { scope: :season_id }

  belongs_to :season
  belongs_to :adult, foreign_key: :user_id, inverse_of: :contracts
end
