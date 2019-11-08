# frozen_string_literal: true

require 'rails_helper'

describe StaffRequest do
  subject { FactoryBot.build(:staff_request) }

  describe 'association' do
    it { is_expected.to belong_to(:season) }
    it { is_expected.to belong_to(:user) }
  end
end
