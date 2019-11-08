class RemoveColumnAgeFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :age
  end

  def down
    add_column :users, :age, :integer
  end
end
