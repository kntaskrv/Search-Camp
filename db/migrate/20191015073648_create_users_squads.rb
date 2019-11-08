class CreateUsersSquads < ActiveRecord::Migration[5.2]
  def change
    create_table :users_squads do |t|
      t.integer :user_id, null: false
      t.integer :squad_id, null: false
    end
    add_index :users_squads, %i[user_id squad_id], unique: true
    add_foreign_key :users_squads, :squads
    add_foreign_key :users_squads, :users
  end
end
