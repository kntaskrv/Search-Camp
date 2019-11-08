# frozen_string_literal: true

class Attachment < ApplicationRecord
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  belongs_to :season
end
