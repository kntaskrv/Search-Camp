# frozen_string_literal: true

require 'rails_helper'

describe Attachment do
  subject { FactoryBot.build(:attachment) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:season) }
  end
end
