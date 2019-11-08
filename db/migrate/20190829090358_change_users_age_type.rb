# frozen_string_literal: true

class ChangeUsersAgeType < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :age, 'integer USING CAST(age AS integer)'
  end

  def down
    change_column :users, :age, :string
  end
end
