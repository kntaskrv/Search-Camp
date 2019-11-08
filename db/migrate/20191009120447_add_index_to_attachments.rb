class AddIndexToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_index :attachments, %i[season_id]
  end
end
