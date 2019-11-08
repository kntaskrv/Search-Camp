# frozen_string_literal: true

module Admin
  class VouchersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_policy
    before_action :load_voucher, only: %i[update]

    def index
      @vouchers = season&.vouchers || Voucher.all
    end

    def update
      if @voucher.update(accepted: params[:flag])
        redirect_to admin_season_vouchers_path
      else
        redirect_to admin_season_vouchers_path, allert: 'voucher change error'
      end
    end

    def import
      render :import
    end

    def import_from_file
      @result = Vouchers::Import.call(season, params[:file])
      if @result.valid?
        redirect_to admin_season_vouchers_path
      else
        redirect_to admin_season_vouchers_path, alert: @result.errors.full_messages.last
      end
    end

    private

    def check_policy
      authorize Voucher
    end

    def season
      @season ||= Season.find(params[:season_id])
    end

    def load_voucher
      @voucher = Voucher.find(params[:id])
    end
  end
end
