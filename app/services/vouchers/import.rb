# frozen_string_literal: true

require 'csv'

module Vouchers
  class Import < BaseServiceApplication
    param :season
    param :file

    def call
      validate
      return self unless valid?

      CSV.foreach(file.path, headers: true) do |row|
        user = Users::Invite.call(row.to_h.except('class_num'))
        voucher = Create.call(season, user, row['class_num'])
        voucher
      end
      self
    end

    private

    def validate
      errors.add(:base, 'file not selected') if file.blank?
    end
  end
end
