class AddForeignKeyToStaffRequest < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :staff_requests, :users
    add_foreign_key :staff_requests, :seasons
  end
end
