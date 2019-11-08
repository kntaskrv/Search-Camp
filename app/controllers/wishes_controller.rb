# frozen_string_literal: true

class WishesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @result = Wishes::Create.call(current_user, wish_params[:email], season)
    render :new
  end

  def update
    result = Wishes::Accept.call(wish)
    Wish.create(child: wish.friend, friend: wish.child, season: wish.season, accepted: true) if result.valid?
    redirect_to user_profile_path
  end

  def destroy
    wish.destroy if wish.present?
    redirect_to user_profile_path
  end

  private

  def wish_params
    params.require(:wish).permit(:email)
  end

  def wish
    @wihs ||= Wish.find(params[:wish_id])
  end

  def season
    @season ||= Season.find(params[:season_id])
  end
end
