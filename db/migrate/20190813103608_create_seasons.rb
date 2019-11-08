# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :location
      t.string :date_start
      t.string :date_end

      t.timestamps
    end
  end
end
