# frozen_string_literal: true

class Adult < User
  has_many :contracts, foreign_key: :user_id, dependent: :destroy, inverse_of: :adult
  has_many :seasons, through: :contracts
end
