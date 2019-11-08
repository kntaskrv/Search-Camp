# frozen_string_literal: true

module Vouchers
  class Create < BaseServiceApplication
    param :season
    param :user
    param :class_num

    def call
      validate
      return voucher unless valid?

      voucher.save
      self.result = voucher
      self
    end

    def validate
      errors.merge_with_models(voucher) unless voucher.valid?
    end

    def voucher
      @voucher ||= Voucher.new(child: user, season: season, class_num: class_num)
    end
  end
end
