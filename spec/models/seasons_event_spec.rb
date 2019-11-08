# frozen_string_literal: true

require 'rails_helper'

describe SeasonsEvent do
  subject { FactoryBot.build(:seasons_event) }

  describe 'association' do
    it { is_expected.to belong_to(:season) }
    it { is_expected.to belong_to(:event) }
  end
end
