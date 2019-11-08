class AddForeignKeyToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :attachments, :seasons  
  end
end
