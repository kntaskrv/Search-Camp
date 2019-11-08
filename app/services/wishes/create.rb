# frozen_string_literal: true

module Wishes
  class Create < BaseServiceApplication
    param :user
    param :email
    param :season

    option :config, default: -> { Rails.configuration.application['squad'] }

    def call
      validate
      return self unless valid?

      self.result = create_wish
      self
    end

    private

    def validate
      errors.add(:base, 'friend already sent you a wish') if wish
      errors.add(:base, 'email must exist') if email.blank?
      errors.add(:base, 'friend must registred in season') unless registred_in_season?
      errors.add(:base, 'wish already exist') if wish_exist?
      errors.add(:base, 'friend must exist') unless friend
      errors.add(:base, 'you already have a lot of wishes') if wishes_full?
      errors.add(:base, 'you can not enter your email') if wrong_email?
    end

    def wrong_email?
      user.email == email
    end

    def wishes_full?
      user.wishes.count >= config['squad_capacity']
    end

    def registred_in_season?
      season.children.where(id: friend).any?
    end

    def friend
      @friend ||= Child.find_by(email: email)
    end

    def wish
      @wish ||= season.wishes.find_by(child: friend, friend: user)
    end

    def wish_exist?
      season.wishes.find_by(child: user, friend: friend).present?
    end

    def create_wish
      new_wish = Wish.new(child: user, friend: friend, season: season)
      return unless new_wish.save

      new_wish
    end
  end
end
