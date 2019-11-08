# frozen_string_literal: true

class Member < ApplicationRecord
  validates :user, uniqueness: { scope: :event }

  belongs_to :user
  belongs_to :event
end
