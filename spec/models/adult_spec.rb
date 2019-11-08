# frozen_string_literal: true

require 'rails_helper'

describe Adult do
  subject { FactoryBot.build(:adult) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:birthday) }
  end

  describe 'association' do
    it { is_expected.to have_many(:contracts) }
    it { is_expected.to have_many(:seasons) }
  end
end
