# frozen_string_literal: true

module Staffs
  class Invite < BaseServiceApplication
    param :season
    param :user
    def call
      validate
      return request unless valid?

      request.save
      self.result = request
      self
    end

    def validate
      errors.merge_with_models(request) unless request.valid?
    end

    def request
      @request ||= StaffRequest.new(season: season, user: user)
    end
  end
end
