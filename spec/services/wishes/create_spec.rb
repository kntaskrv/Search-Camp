# frozen_string_literal: true

require 'rails_helper'

describe Wishes::Create do
  subject { described_class.call(user, email, season) }

  let(:user) { create(:child) }
  let(:email) {}
  let(:season) { create(:season) }

  shared_examples 'wish invalid' do |messages|
    it 'returns Wish#count' do
      expect { subject }.not_to change { Wish.count }
    end

    it 'returns errors' do
      expect(subject.errors.full_messages).to eq(messages)
    end
  end

  context 'without emails' do
    it_behaves_like 'wish invalid', ["email must exist, friend must registred in season, friend must exist"]
  end

  context 'with emails' do
    context 'when entered self email' do
      let(:email) { user.email }

      it_behaves_like 'wish invalid', ["friend must registred in season, you can not enter your email"]
    end

    context 'when wish is full' do
      let(:user) { create(:child) }
      let(:friend) { create(:child) }
      let(:email) { friend.email }

      before do
        20.times do
          friend = create(:child)
          create(:wish, child: user, friend: friend, season: season)
        end
      end

      it_behaves_like 'wish invalid', ['friend must registred in season, you already have a lot of wishes']
    end

    context 'when wish exist' do
      let!(:wish) { create(:wish) }
      let(:user) { wish.child }
      let(:friend) { wish.friend }
      let(:email) { friend.email }
      let(:season) { wish.season }

      it_behaves_like 'wish invalid', ['friend must registred in season, wish already exist']

      context 'when friend\'s wish exist' do
        let!(:wish) { create(:wish) }
        let(:user) { wish.friend }
        let(:friend) { wish.child }
        let(:email) { friend.email }

        it_behaves_like 'wish invalid', ["friend already sent you a wish, friend must registred in season"]
      end
    end

    context 'when wish not exist' do
      context 'when friend not exist' do
        let(:email) { 'aaa@gmail.com' }

        it_behaves_like 'wish invalid', ['friend must registred in season, friend must exist']
      end

      context 'when friend exist and friend registred in season' do
        let(:friend) { create(:child) }
        let(:email) { friend.email }

        before do
          create(:voucher, child: friend, season: season)
        end

        it 'returns Wish#count' do
          expect { subject }.to change { Wish.count }.from(0).to(1)
        end

        it 'returns errors' do
          expect(subject.errors.full_messages).to be_empty
        end
      end
    end
  end
end
