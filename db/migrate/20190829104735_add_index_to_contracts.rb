# frozen_string_literal: true

class AddIndexToContracts < ActiveRecord::Migration[5.2]
  def change
    add_index :contracts, %i[user_id season_id], unique: true
  end
end
