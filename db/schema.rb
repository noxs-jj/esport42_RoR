# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160519152141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contact_us", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nickname",            default: ""
    t.string   "first_name",          default: ""
    t.string   "last_name",           default: ""
    t.string   "email",                            null: false
    t.string   "phone",               default: ""
    t.string   "entity",              default: ""
    t.string   "object",              default: ""
    t.string   "message",                          null: false
    t.string   "other",               default: ""
    t.string   "adress_line1",        default: ""
    t.string   "adress_line2",        default: ""
    t.string   "adress_line3",        default: ""
    t.string   "adress_city",         default: ""
    t.string   "adress_province",     default: ""
    t.string   "adress_postalcode",   default: ""
    t.string   "adress_country",      default: ""
    t.string   "adress_otherDetails", default: ""
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "event_statuses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                             null: false
    t.integer  "created_by",                       null: false
    t.integer  "games_ids",           default: [],              array: true
    t.integer  "tournament_ids",      default: [],              array: true
    t.integer  "participant_ids",     default: [],              array: true
    t.datetime "date"
    t.string   "adress_line1",        default: ""
    t.string   "adress_line2",        default: ""
    t.string   "adress_line3",        default: ""
    t.string   "adress_city",         default: ""
    t.string   "adress_province",     default: ""
    t.string   "adress_postalcode",   default: ""
    t.string   "adress_country",      default: ""
    t.string   "adress_otherDetails", default: ""
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "status_id"
    t.text     "info",                default: ""
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "icon",       default: ""
    t.string   "url",        default: ""
    t.string   "editor",     default: ""
    t.text     "info",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "participant_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participant_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "event_id",                    null: false
    t.integer  "type_id",                     null: false
    t.integer  "status_id",                   null: false
    t.integer  "tournament_ids", default: [],              array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",            default: "", null: false
    t.string   "game_id",         default: ""
    t.string   "event_id",        default: "", null: false
    t.integer  "participant_ids", default: [],              array: true
    t.integer  "max_players",     default: 0
    t.integer  "created_by",                   null: false
    t.text     "rules",           default: ""
    t.text     "brackets_info",   default: ""
    t.text     "other_info",      default: ""
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "username",               default: ""
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.datetime "birthday"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "adress_line1",           default: ""
    t.string   "adress_line2",           default: ""
    t.string   "adress_line3",           default: ""
    t.string   "adress_city",            default: ""
    t.string   "adress_province",        default: ""
    t.string   "adress_postalcode",      default: ""
    t.string   "adress_country",         default: ""
    t.string   "adress_otherDetails",    default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "organizer",              default: false
    t.boolean  "referee",                default: false
    t.boolean  "volunteer",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
