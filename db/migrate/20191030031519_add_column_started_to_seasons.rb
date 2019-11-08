class AddColumnStartedToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :started, :boolean, default: false
  end
end
