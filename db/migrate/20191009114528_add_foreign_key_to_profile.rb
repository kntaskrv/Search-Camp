class AddForeignKeyToProfile < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :profiles, :users
  end
end
