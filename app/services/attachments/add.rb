# frozen_string_literal: true

module Attachments
  class Add < BaseServiceApplication
    param :season
    param :images

    def call
      photos = []
      images.each do |image|
        photos << Create.call(season, image)
      end
      photos
    end
  end
end
