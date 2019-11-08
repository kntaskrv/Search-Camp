# frozen_string_literal: true

class AddIndexToMembers < ActiveRecord::Migration[5.2]
  def change
    add_index :members, %i[user_id event_id], unique: true
  end
end
