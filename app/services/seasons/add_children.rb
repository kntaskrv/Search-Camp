# frozen_string_literal: true

module Seasons
  class AddChildren < BaseServiceApplication
    param :season
    param :user

    option :config, default: -> { Rails.configuration.application['squad'] }

    def call
      Seasons::CreateSquads.call(season)
      r = Wishes::CreateGroups.call(season)
      errors.add(:base, r.errors.full_messages.first) unless r.valid?
      groups = r.result
      add_children_to_squads(groups)
      validate
      if user
        AdminMailer.example(user, result, season).deliver unless valid?
      end
      self
    end

    private

    def validate
      errors.add(:base, 'can not added children in squads') if result.any?
    end

    def add_children_to_squads(groups)
      self.result = []
      groups.each do |group|
        is_group_added_to_any_squad = season.squads.any? do |squad|
          next unless squad_free?(squad, group)

          add_children_to_squad(group, squad)
        end
        result.push(group) unless is_group_added_to_any_squad
      end
    end

    def add_children_to_squad(children, squad)
      children.each do |child_id|
        UsersSquad.create(user_id: child_id, squad: squad)
      end
    end

    def squad_free?(squad, group)
      group.count <= config['squad_capacity'] - squad.children_count
    end
  end
end
