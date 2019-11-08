# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    preload
    render 'users/profile'
  end

  private

  def preload
    @user = User.find(params[:user_id])
    @requests = @user.staff_requests.preload(:season)
    @wishes = Wish.where(accepted: false, friend: @user).preload(:child)
  end
end
