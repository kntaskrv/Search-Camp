# frozen_string_literal: true

module Admin
  class ContractsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_policy, except: %i[destroy accept]

    def index
      @users = season.adults
      render 'admin/seasons/staff'
    end

    def create
      @result = Staffs::Invite.call(season, user)
      return render 'layouts/_errors' unless @result.valid?

      redirect_to adult_list_admin_season_path(season)
    end

    def accept
      if staff_request
        authorize staff_request
        @result = Staffs::Create.call(season, user)
        return render 'layouts/errors' unless @result.valid?
      end

      redirect_to user_profile_path(user)
    end

    def destroy
      if staff_request
        authorize staff_request
        Staffs::Refuse.call(season, user)
      end
      redirect_to adult_list_admin_season_path(season)
    end

    def delete_employee
      season.adults.destroy(user)
      redirect_to admin_season_contracts_path(season)
    end

    private

    def staff_request
      @staff_request ||= season.staff_requests.find_by(user: user)
    end

    def season
      @season ||= Season.find(params[:season_id])
    end

    def user
      @user ||= User.find(params[:user_id])
    end

    def check_policy
      authorize Contract
    end
  end
end
