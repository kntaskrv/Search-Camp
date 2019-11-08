class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.integer :season_id, null: false
      t.boolean :accepted, default: false
    end
    add_index :wishes, %i[user_id friend_id season_id], unique: true
    add_foreign_key :wishes, :users
    add_foreign_key :wishes, :seasons
  end
end
