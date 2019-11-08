class ChangeColumnsToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :attachments, :season_id, :integer, null: false
    change_column :attachments, :image, :string, null: false
    change_column :comments, :season_id, :integer, null: false
    change_column :contracts, :season_id, :integer, null: false
    change_column :contracts, :user_id, :integer, null: false
    change_column :events, :name, :string, null: false
    change_column :events, :location, :string, null: false
    change_column :events, :date, :date, null: false
    change_column :members, :user_id, :integer, null: false
    change_column :members, :event_id, :integer, null: false
    change_column :profiles, :user_id, :bigint, null: false
    change_column :seasons, :name, :string, null: false
    change_column :seasons, :location, :string, null: false
    change_column :seasons, :date_start, :date, null: false
    change_column :seasons, :date_end, :date, null: false
    change_column :seasons_events, :season_id, :integer, null: false
    change_column :seasons_events, :event_id, :integer, null: false
    change_column :staff_requests, :season_id, :integer, null: false
    change_column :staff_requests, :user_id, :integer, null: false
    change_column :users, :name, :string, null: false
    change_column :users, :birthday, :date, null: false
    change_column :vouchers, :season_id, :integer, null: false
    change_column :vouchers, :user_id, :integer, null: false
    change_column :vouchers, :class_num, :integer, null: false
  end

  def down
    change_column :attachments, :season_id, :integer
    change_column :attachments, :image, :string
    change_column :comments, :season_id, :integer
    change_column :contracts, :season_id, :integer
    change_column :contracts, :user_id, :integer
    change_column :events, :name, :string
    change_column :events, :location, :string
    change_column :events, :date, :date
    change_column :members, :user_id, :integer
    change_column :members, :event_id, :integer
    change_column :profiles, :user_id, :bigint
    change_column :seasons, :name, :string
    change_column :seasons, :location, :string
    change_column :seasons, :date_start, :date
    change_column :seasons, :date_end, :date
    change_column :seasons_events, :season_id, :integer
    change_column :seasons_events, :event_id, :integer
    change_column :staff_requests, :season_id, :integer
    change_column :staff_requests, :user_id, :integer
    change_column :users, :name, :string
    change_column :users, :birthday, :date
    change_column :vouchers, :season_id, :integer
    change_column :vouchers, :user_id, :integer
    change_column :vouchers, :class_num, :integer
  end
end
