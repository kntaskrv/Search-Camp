# frozen_string_literal: true

module Staffs
  class Create < BaseServiceApplication
    param :season
    param :user

    def call
      validate
      return contract unless valid?

      contract.save
      Refuse.call(season, user)
      self.result = contract
      self
    end

    private

    def validate
      errors.merge_with_models(contract) unless contract.valid?
    end

    def contract
      @contract ||= Contract.new(season: season, adult: user)
    end
  end
end
