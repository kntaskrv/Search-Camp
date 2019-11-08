# frozen_string_literal: true

class CreateSeasonsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons_events do |t|
      t.integer :season_id
      t.integer :event_id
    end
  end
end
