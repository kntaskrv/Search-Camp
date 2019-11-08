# frozen_string_literal: true

require 'rails_helper'

describe Season do
  subject { FactoryBot.build(:season) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:date_start) }
    it { is_expected.to validate_presence_of(:date_end) }
  end

  describe 'association' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:attachments) }
    it { is_expected.to have_many(:seasons_events) }
    it { is_expected.to have_many(:events) }
    it { is_expected.to have_many(:vouchers) }
    it { is_expected.to have_many(:children) }
    it { is_expected.to have_many(:contracts) }
    it { is_expected.to have_many(:adults) }
    it { is_expected.to have_many(:staff_requests) }
  end
end
