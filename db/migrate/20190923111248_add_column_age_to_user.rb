class AddColumnAgeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :date
  end
end
