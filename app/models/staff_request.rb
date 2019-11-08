# frozen_string_literal: true

class StaffRequest < ApplicationRecord
  validates :user, uniqueness: { scope: :season }

  belongs_to :season
  belongs_to :user
end
