# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :user, uniqueness: true

  belongs_to :user, dependent: :destroy
end
