# frozen_string_literal: true

require 'rails_helper'

describe Contract do
  subject { FactoryBot.build(:contract) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:salary) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:adult) }
    it { is_expected.to belong_to(:season) }
  end
end
