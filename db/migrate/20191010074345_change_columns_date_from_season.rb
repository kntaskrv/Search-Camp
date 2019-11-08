class ChangeColumnsDateFromSeason < ActiveRecord::Migration[5.2]
  def up
    remove_column :seasons, :date_start
    remove_column :seasons, :date_end
    add_column :seasons, :date_start, :date
    add_column :seasons, :date_end, :date
  end

  def down
    remove_column :seasons, :date_start
    remove_column :seasons, :date_end
    add_column :seasons, :date_start, :string
    add_column :seasons, :date_end, :string
  end
end
