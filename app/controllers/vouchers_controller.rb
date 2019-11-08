# frozen_string_literal: true

class VouchersController < ApplicationController
  before_action :authenticate_user!

  def new
    season
    @voucher = Voucher.new
  end

  def create
    season
    @voucher = Voucher.new(voucher_params)
    if @voucher.save
      redirect_to season_path(params[:season_id])
    else
      render :new
    end
  end

  private

  def season
    @season ||= Season.find(params[:season_id])
  end

  def voucher_params
    params.require(:voucher).permit(:user_id, :season_id, :class_num)
  end
end
