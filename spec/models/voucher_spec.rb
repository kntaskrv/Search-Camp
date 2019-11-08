# frozen_string_literal: true

require 'rails_helper'

describe Voucher do
  subject { FactoryBot.build(:voucher) }

  describe 'association' do
    it { is_expected.to belong_to(:season) }
    it { is_expected.to belong_to(:child) }
  end
end
