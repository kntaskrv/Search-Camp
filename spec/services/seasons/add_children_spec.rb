require 'rails_helper'

describe Seasons::AddChildren do
  subject { described_class.call(season, admin) }

  let(:season) { create(:season) }
  let(:admin) {}

  context 'without wishes' do
    before do
      create_list :voucher, 100, season: season
    end

    it 'returns Squad#count' do
      expect { subject }.to change { Squad.where(children_count: 20).count }.to(5)
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq []
    end
  end

  context 'with wishes' do
    let(:user1) { create(:child) }
    let(:user2) { create(:child) }

    before do
      create(:voucher, child: user1, season: season)
      create(:voucher, child: user2, season: season)
      create_list :voucher, 16, season: season
      11.times do
        friend = create(:child)
        create(:voucher, child: friend, season: season)
        create(:wish, :accepted, child: user1, friend: friend, season: season)
        create(:wish, :accepted, child: friend, friend: user1, season: season)
        friend = create(:child)
        create(:voucher, child: friend, season: season)
        create(:wish, :accepted, child: user2, friend: friend, season: season)
        create(:wish, :accepted, child: friend, friend: user2, season: season)
      end
    end

    it 'returns Squad#count' do
      expect { subject }.to change { Squad.where(children_count: 20).count }.to(2)
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq []
    end
  end

  context 'when could not add children' do
    let(:admin) { create(:user) }
    let(:user1) { create(:child) }
    let(:user2) { create(:child) }
    let(:user3) { create(:child) }
    let(:user4) { create(:child) }
    let(:users) { [user1, user2, user3, user4] }

    before do
      users.each do |user|
        create(:voucher, child: user, season: season)
        14.times do
          friend = create(:child)
          create(:voucher, child: friend, season: season)
          create(:wish, :accepted, child: user, friend: friend, season: season)
          create(:wish, :accepted, child: friend, friend: user, season: season)
        end
      end
    end

    it 'returns count' do
      expect(subject.result.count).to eq 1
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq ['can not added children in squads']
    end
  end
end
