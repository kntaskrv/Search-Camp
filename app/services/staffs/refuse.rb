# frozen_string_literal: true

module Staffs
  class Refuse < BaseServiceApplication
    param :season
    param :user

    def call
      staff_request.destroy
    end

    private

    def staff_request
      @staff_request ||= season.staff_requests.find_by!(user: user)
    end
  end
end
