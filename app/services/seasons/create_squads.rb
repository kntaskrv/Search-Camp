# frozen_string_literal: true

module Seasons
  class CreateSquads < BaseServiceApplication
    param :season

    option :config, default: -> { Rails.configuration.application['squad'] }

    def call
      min_squad_count.times { create_squad }
    end

    private

    def min_squad_count
      (season.children.count.to_f / config['squad_capacity']).ceil
    end

    def create_squad
      season.squads.create(season: season)
    end
  end
end
