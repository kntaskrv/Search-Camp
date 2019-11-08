require 'rails_helper'

describe Wishes::Accept do
  subject { described_class.call(wish) }

  let(:wish) {}

  context 'when child has two lvl friend' do
    let(:season) { create(:season) }
    let(:child1) { create(:child) }
    let(:child2) { create(:child) }
    let(:child3) { create(:child) }
    let(:child4) { create(:child) }
    let(:wish) { create(:wish, child: child1, season: season) }

    before do
      create(:wish, :accepted, child: child1, friend: child2, season: season)
      create(:wish, :accepted, child: child2, friend: child1, season: season)
      create(:wish, :accepted, child: child2, friend: child3, season: season)
      create(:wish, :accepted, child: child3, friend: child2, season: season)
      friend = create(:child)
      create(:wish, :accepted, child: child3, friend: friend, season: season)
      create(:wish, :accepted, child: friend, friend: child3, season: season)
      create(:wish, :accepted, child: child3, friend: child4, season: season)
      create(:wish, :accepted, child: child4, friend: child3, season: season)
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq []
    end
  end

  context 'when child has many wishes' do
    let(:season) { create(:season) }
    let(:child) { create(:child) }
    let(:wish) { create(:wish, child: child, season: season) }

    before do
      20.times do
        friend = create(:child)
        create(:wish, :accepted, child: child, friend: friend, season: season)
      end
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq ["already the maximum number of wishes"]
    end
  end

  context 'when friend has more than 18 wishes' do
    let(:season) { create(:season) }
    let(:child) { create(:child) }
    let(:friend) { create(:child) }
    let(:wish) { create(:wish, :accepted, child: child, friend: friend, season: season) }

    before do
      create_list :wish, 19, :accepted, child: friend, season: season
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq ["already the maximum number of wishes"]
    end
  end

  context 'when friend has less than 19 wishes' do
    let(:season) { create(:season) }
    let(:child) { create(:child) }
    let(:friend) { create(:child) }
    let(:wish) { create(:wish, :accepted, child: child, friend: friend, season: season) }

    before do
      create_list :wish, 18, :accepted, child: friend, season: season
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq []
    end
  end

  context 'when child has many unaccepted wishes' do
    let(:season) { create(:season) }
    let(:child) { create(:child) }
    let(:wish) { create(:wish, child: child, season: season) }

    before do
      20.times do
        friend = create(:child)
        create(:wish, child: child, friend: friend, season: season)
      end
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq []
    end
  end
end
