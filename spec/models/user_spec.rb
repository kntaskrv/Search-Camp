# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject { FactoryBot.build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:birthday) }
  end

  describe 'association' do
    it { is_expected.to have_one(:profile) }

    it { is_expected.to have_many(:members) }
    it { is_expected.to have_many(:events) }
    it { is_expected.to have_many(:staff_requests) }
    it { is_expected.to have_many(:comments) }
  end
end
