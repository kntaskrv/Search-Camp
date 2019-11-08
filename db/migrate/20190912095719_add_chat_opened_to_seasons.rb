class AddChatOpenedToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :chat_opened, :boolean, default: false
  end
end
