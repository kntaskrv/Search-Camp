# frozen_string_literal: true

require 'rails_helper'

describe Member do
  subject { FactoryBot.build(:member) }

  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:event) }
  end
end
