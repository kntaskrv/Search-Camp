# frozen_string_literal: true

class Child < User
  has_many :wishes, foreign_key: :user_id, dependent: :destroy

  has_many :vouchers, foreign_key: :user_id, inverse_of: :child, dependent: :destroy
  has_many :seasons, through: :vouchers

  has_many :users_squads, foreign_key: :user_id, dependent: :destroy
  has_many :squads, through: :users_squads
end
