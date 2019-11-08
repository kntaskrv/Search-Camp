# frozen_string_literal: true

class Season < ApplicationRecord
  validates :name, :location, :date_start, :date_end, presence: true

  has_many :comments, dependent: :destroy

  has_many :wishes, dependent: :destroy

  has_many :attachments, dependent: :destroy

  has_many :seasons_events, dependent: :destroy
  has_many :events, through: :seasons_events

  has_many :vouchers, dependent: :destroy
  has_many :children, through: :vouchers

  has_many :contracts, dependent: :destroy
  has_many :adults, through: :contracts

  has_many :staff_requests, dependent: :destroy

  has_many :squads, dependent: :destroy

  def add_event(event)
    events << event
  rescue StandardError
    false
  end
end
