# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :load_user, only: %i[
      show edit update destroy
      op_user deop_user
    ]

    def index
      authorize User
      users
    end

    def show
      authorize @user
    end

    def new
      @user = User.new
      authorize @user
    end

    def create
      @user = User.new(user_params)
      authorize @user

      if @user.save
        redirect_to user_profile(@user)
      else
        render :new
      end
    end

    def edit
      authorize @user
    end

    def update
      authorize @user
      if @user.update(user_params)
        redirect_to user_profile_path(@user)
      else
        render :edit
      end
    end

    def destroy
      authorize @user
      @user.destroy
      redirect_to admin_users_path
    end

    def join_to_event
      authorize current_user
      current_user.events << event unless current_user.events.include?(event)
      redirect_to admin_events_path
    end

    def leave_event
      authorize current_user
      current_user.events.destroy(Event.find(params[:id]))
      redirect_to admin_events_path
    end

    def op_user
      authorize @user
      @user.role = 1
      @user.save
      redirect_to admin_users_path
    end

    def deop_user
      authorize @user
      @user.role = 0
      @user.save
      redirect_to admin_users_path
    end

    def import_from_file
      @result = Users::Import.call(params[:file])
      if @result.valid?
        redirect_to admin_users_path
      else
        redirect_to admin_users_path, alert: @result.errors.full_messages.last
      end
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def event
      @event ||= Event.find(params[:id])
    end

    def user_not_authorized
      redirect_to(request.referer || root_path, alert: 'You do not have rights')
    end

    def user_params
      params.require(:user).permit(:name, :age)
    end

    def load_user
      @user = User.find(params[:id])
    rescue StandardError
      @users = User.all
      render :index
    end

    def users
      @users ||= Users::Filter.call(params[:age_type])
    end
  end
end
