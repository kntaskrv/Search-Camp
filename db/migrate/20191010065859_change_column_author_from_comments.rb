class ChangeColumnAuthorFromComments < ActiveRecord::Migration[5.2]
  def up
    remove_column :comments, :author
    add_column :comments, :user_id, :integer, null: false
  end

  def down
    remove_column :comments, :user_id
    add_column :comments, :author, :string
  end
end
