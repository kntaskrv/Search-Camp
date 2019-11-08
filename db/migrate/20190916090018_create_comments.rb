class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :season_id
      t.string :author
      t.string :message, null: false
    end
  end
end
