# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  subject { FactoryBot.build(:comment) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:message) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:season) }
  end
end
