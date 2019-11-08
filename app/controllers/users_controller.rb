# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: %i[show edit update]

  def show; end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def join_to_event
    authorize current_user
    current_user.events << event unless current_user.events.include?(event)
    redirect_to events_path
  end

  def leave_event
    authorize current_user
    current_user.events.destroy(Event.find(params[:id]))
    redirect_to events_path
  end

  def profile
    preload
    render 'users/profile'
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def event
    @event ||= Event.find(params[:id])
  end

  def user_not_authorized
    redirect_to(request.referer || root_path, alert: 'У вас нет на это прав')
  end

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age)
  end

  def preload
    @user = User.find(params[:id])
    @requests = @user.staff_requests.preload(:season)
    @wishes = Wish.where(accepted: false, friend: @user).preload(:child)
  end
end
