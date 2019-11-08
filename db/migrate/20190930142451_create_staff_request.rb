class CreateStaffRequest < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_requests do |t|
      t.integer :user_id
      t.integer :season_id
      t.boolean :accepted, default: false
    end
    add_index :staff_requests, %i[user_id season_id], unique: true
  end
end
