class AddColumnToSquad < ActiveRecord::Migration[5.2]
  def change
    add_column :squads, :children_count, :integer, default: 0
  end
end
