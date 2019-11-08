module Wishes
  class Accept < BaseServiceApplication
    param :wish

    option :config, default: -> { Rails.configuration.application['squad'] }

    def call
      validate
      return self unless valid?

      wish.update(accepted: true)
      self.result = wish
      self
    end

    private

    def validate
      errors.add(:base, 'already the maximum number of wishes') if wishes_max?
    end

    def wishes_max?
      wish_count.present? && wish_count >= config['squad_capacity']
    end

    def wish_count
      return @wish_count if defined? @wish_count

      groups = Wishes::CreateGroups.call(wish.season).result
      @wish_count = groups.detect { |group| group.include?(wish.user_id) }&.size
    end
  end
end
