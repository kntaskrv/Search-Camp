# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :message, presence: true

  belongs_to :season
  belongs_to :user
end
