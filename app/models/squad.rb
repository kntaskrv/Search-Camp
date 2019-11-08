# frozen_string_literal: true

class Squad < ApplicationRecord
  belongs_to :season

  has_many :users_squads, dependent: :destroy
  has_many :children, through: :users_squads
end
