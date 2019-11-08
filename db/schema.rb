# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_30_031519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer "season_id", null: false
    t.string "image", null: false
    t.index ["season_id"], name: "index_attachments_on_season_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "season_id", null: false
    t.string "message", null: false
    t.integer "user_id", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "season_id", null: false
    t.integer "salary", default: 5000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "season_id"], name: "index_contracts_on_user_id_and_season_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.index ["user_id", "event_id"], name: "index_members_on_user_id_and_event_id", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "chat_opened", default: false
    t.date "date_start", null: false
    t.date "date_end", null: false
    t.boolean "started", default: false
  end

  create_table "seasons_events", force: :cascade do |t|
    t.integer "season_id", null: false
    t.integer "event_id", null: false
    t.index ["season_id", "event_id"], name: "index_seasons_events_on_season_id_and_event_id", unique: true
  end

  create_table "squads", force: :cascade do |t|
    t.integer "season_id", null: false
    t.string "name"
    t.integer "children_count", default: 0
    t.index ["season_id"], name: "index_squads_on_season_id"
  end

  create_table "staff_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "season_id", null: false
    t.boolean "accepted", default: false
    t.index ["user_id", "season_id"], name: "index_staff_requests_on_user_id_and_season_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.boolean "admin", default: false
    t.integer "role", default: 0
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.date "birthday", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_squads", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "squad_id", null: false
    t.index ["user_id", "squad_id"], name: "index_users_squads_on_user_id_and_squad_id", unique: true
  end

  create_table "vouchers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "season_id", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.integer "class_num", null: false
    t.index ["user_id", "season_id"], name: "index_vouchers_on_user_id_and_season_id", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.integer "season_id", null: false
    t.boolean "accepted", default: false
    t.index ["user_id", "friend_id", "season_id"], name: "index_wishes_on_user_id_and_friend_id_and_season_id", unique: true
  end

  add_foreign_key "attachments", "seasons"
  add_foreign_key "profiles", "users"
  add_foreign_key "squads", "seasons"
  add_foreign_key "staff_requests", "seasons"
  add_foreign_key "staff_requests", "users"
  add_foreign_key "users_squads", "squads"
  add_foreign_key "users_squads", "users"
  add_foreign_key "wishes", "seasons"
  add_foreign_key "wishes", "users"
end
