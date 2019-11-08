# frozen_string_literal: true

class AddIndexToSeasonsEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :seasons_events, %i[season_id event_id], unique: true
  end
end
