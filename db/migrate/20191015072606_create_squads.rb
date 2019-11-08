class CreateSquads < ActiveRecord::Migration[5.2]
  def change
    create_table :squads do |t|
      t.integer :season_id, null: false
      t.string :name
    end
    add_index :squads, %i[season_id]
    add_foreign_key :squads, :seasons
  end
end
