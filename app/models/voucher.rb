# frozen_string_literal: true

class Voucher < ApplicationRecord
  validates :user_id, uniqueness: { scope: :season_id }

  belongs_to :season, inverse_of: :vouchers
  belongs_to :child, foreign_key: :user_id, inverse_of: :vouchers
end
