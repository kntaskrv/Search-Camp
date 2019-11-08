# frozen_string_literal: true

class UsersSquad < ApplicationRecord
  validates :squad, uniqueness: { scope: :child }

  belongs_to :squad, counter_cache: :children_count
  belongs_to :child, foreign_key: :user_id
end
