module Wishes
  class CreateGroups < BaseServiceApplication
    param :season

    option :config, default: -> { Rails.configuration.application['squad'] }

    def call
      groups = season.wishes.where(accepted: true).group(:user_id).pluck('ARRAY_APPEND(ARRAY_AGG(friend_id), user_id)')
      join(groups)
      add_children_without_wishes if children_without_wishes.any?
      validate
      return self unless valid?

      result.sort!
      self
    end

    private

    def validate
      errors.add(:base, 'group size exceeds squad capacity') unless groups_valid?
    end

    def groups_valid?
      result.each do |group|
        return false if group.size > config['squad_capacity']
      end
      true
    end

    def join(groups)
      self.result = []
      groups.each do |group|
        groups.each do |g|
          next if g == group
          next unless (g & group).any?

          group |= g
        end
        result << group.sort
      end
      result.uniq!
      return join(result) if intersection?(groups)

      result
    end

    def intersection?(groups)
      groups.flatten.size != groups.flatten.uniq.size
    end

    def children_without_wishes
      season.wishes.where(accepted: false).destroy_all
      season.children.joins("LEFT JOIN wishes ON wishes.user_id = users.id AND wishes.season_id = #{season.id}").where(wishes: { user_id: nil })
    end

    def add_children_without_wishes
      children_without_wishes.each do |child|
        result << [child.id]
      end
    end
  end
end
