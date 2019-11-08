class ChangeColumnDateFromEvents < ActiveRecord::Migration[5.2]
  def up
    remove_column :events, :date
    add_column :events, :date, :date
  end

  def down
    remove_column :events, :date
    add_column :events, :date, :string
  end
end
