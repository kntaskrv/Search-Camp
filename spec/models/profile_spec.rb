# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile do
  subject { FactoryBot.build(:profile) }

  describe 'association' do
    it { is_expected.to belong_to(:user) }
  end
end
