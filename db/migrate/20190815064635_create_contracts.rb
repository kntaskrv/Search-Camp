# frozen_string_literal: true

class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :user_id
      t.integer :season_id
      t.integer :salary, default: 5000

      t.timestamps
    end
  end
end
