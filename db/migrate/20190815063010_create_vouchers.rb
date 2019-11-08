# frozen_string_literal: true

class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      t.integer :user_id
      t.integer :season_id
      t.integer :price

      t.timestamps
    end
  end
end
