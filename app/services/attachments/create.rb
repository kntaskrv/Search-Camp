# frozen_string_literal: true

module Attachments
  class Create < BaseServiceApplication
    param :season
    param :image

    def call
      validate
      return attachment unless valid?

      attachment.save
      self.result = attachment
      self
    end

    def validate
      errors.merge_with_models(contract) unless attachment.valid?
    end

    private

    def attachment
      @attachment ||= Attachment.new(season: season, image: image)
    end
  end
end
