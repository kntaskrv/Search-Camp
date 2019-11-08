class AddIndexToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_index :vouchers, %i[user_id season_id], unique: true
  end
end
