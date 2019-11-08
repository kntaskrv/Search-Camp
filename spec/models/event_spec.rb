# frozen_string_literal: true

require 'rails_helper'

describe Event do
  subject { FactoryBot.build(:event) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:date) }
  end

  describe 'association' do
    it { is_expected.to have_many(:seasons) }
    it { is_expected.to have_many(:seasons_events) }
    it { is_expected.to have_many(:members) }
    it { is_expected.to have_many(:users) }
  end
end
