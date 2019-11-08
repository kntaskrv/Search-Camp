# frozen_string_literal: true

require 'rails_helper'

describe Child do
  subject { FactoryBot.build(:child) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:birthday) }
  end

  describe 'association' do
    it { is_expected.to have_many(:vouchers) }
    it { is_expected.to have_many(:seasons) }
  end
end
