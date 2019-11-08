require 'rails_helper'

describe Wishes::CreateGroups do
  subject { described_class.call(season) }

  let(:season) { create(:season) }

  context 'when group valid' do
    context 'when wishes are empty' do
      before do
        20.times do
          user = create(:child)
          create(:voucher, child: user, season: season)
        end
      end

      it 'returns count' do
        expect(subject.result.count).to eq 20
      end
    end

    context 'when wishes are not empty' do
      context 'without intersections' do
        let(:user1) { create(:child) }
        let(:user2) { create(:child) }

        before do
          create(:voucher, child: user1, season: season)
          create(:voucher, child: user2, season: season)
          5.times do
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

        it 'returns count' do
          expect(subject.result.count).to eq 2
        end
      end

      context 'with intersections' do
        let(:user1) { create(:child) }
        let(:user2) { create(:child) }
        let(:friend) {}

        before do
          create(:voucher, child: user1, season: season)
          create(:voucher, child: user2, season: season)
          5.times do
            friend = create(:child)
            create(:voucher, child: friend, season: season)
            create(:wish, :accepted, child: user1, friend: friend, season: season)
            create(:wish, :accepted, child: friend, friend: user1, season: season)
            friend = create(:child)
            create(:voucher, child: friend, season: season)
            create(:wish, :accepted, child: user2, friend: friend, season: season)
            create(:wish, :accepted, child: friend, friend: user2, season: season)
          end
          create(:wish, :accepted, child: Child.last, friend: user1, season: season)
          create(:wish, :accepted, child: user1, friend: Child.last, season: season)
        end

        it 'returns count' do
          expect(subject.result.count).to eq 1
        end
      end
    end
  end

  context 'when group invalid' do
    let(:user1) { create(:child) }
    let(:user2) { create(:child) }

    before do
      create(:voucher, child: user1, season: season)
      create(:voucher, child: user2, season: season)
      create(:wish, :accepted, child: user1, friend: user2, season: season)
      create(:wish, :accepted, child: user2, friend: user1, season: season)
      10.times do
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

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq ["group size exceeds squad capacity"]
    end
  end
end
