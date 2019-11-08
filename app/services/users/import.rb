# frozen_string_literal: true

require 'csv'

module Users
  class Import < BaseServiceApplication
    param :file

    def call
      validate
      return self unless valid?

      CSV.foreach(file.path, headers: true) do |row|
        Users::Invite.call(row)
      end
      self
    end

    private

    def validate
      errors.add(:base, 'file not selected') if file.blank?
    end
  end
end
