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

ActiveRecord::Schema.define(version: 20160606144350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bracket_statuses", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "brackets", force: :cascade do |t|
    t.integer  "tournament_id",                  null: false
    t.integer  "event_id",                       null: false
    t.string   "name",           default: "",    null: false
    t.integer  "created_by"
    t.integer  "players"
    t.text     "info",           default: ""
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "cell_populated", default: false
  end

  create_table "cell_statuses", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cells", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "event_id"
    t.integer  "bracket_id"
    t.integer  "slot_id_cell_in_bracket"
    t.integer  "seed_id_parent_openent_1"
    t.integer  "participant_1_id"
    t.integer  "score_1"
    t.integer  "seed_id_parent_openent_2"
    t.integer  "participant_2_id"
    t.integer  "score_2"
    t.datetime "scheduled"
    t.integer  "winner_participant_id"
    t.integer  "cell_id_son"
    t.integer  "updated_by"
    t.text     "info"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "status_id",                default: 1
  end

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

  create_table "menu_categories", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "color",      default: ""
    t.boolean  "visible",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "description", default: ""
    t.string   "body",        default: ""
    t.boolean  "visible",     default: false
    t.string   "banner",      default: ""
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.boolean  "visible",     default: false
    t.string   "banner",      default: ""
    t.string   "title",       default: "",    null: false
    t.string   "description", default: ""
    t.text     "body",        default: ""
    t.string   "sources",     default: [],                 array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "highlight",   default: false
  end

  create_table "tournament_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.string   "game_id",           default: ""
    t.string   "event_id",          default: "", null: false
    t.integer  "participant_ids",   default: [],              array: true
    t.integer  "max_players",       default: 0
    t.integer  "created_by",                     null: false
    t.text     "rules",             default: ""
    t.text     "brackets_info",     default: ""
    t.text     "other_info",        default: ""
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "tournament_status", default: 1
    t.integer  "participant_1_id",  default: [],              array: true
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
    t.string   "skype_id",               default: ""
    t.string   "email_secondary",        default: ""
    t.string   "phone_mobile",           default: ""
    t.string   "phone_home",             default: ""
    t.string   "steam_id",               default: ""
    t.string   "battlenet_id",           default: ""
    t.string   "origin_id",              default: ""
    t.string   "maniaplanet_id",         default: ""
    t.string   "xbox_live",              default: ""
    t.string   "sony_psn",               default: ""
    t.string   "website_url",            default: ""
    t.string   "facebook_private_url",   default: ""
    t.string   "facebook_gamer_url",     default: ""
    t.string   "youtube_url",            default: ""
    t.string   "twitch_url",             default: ""
    t.string   "googleplus_url",         default: ""
    t.string   "sponsor",                default: ""
    t.string   "quote",                  default: ""
    t.string   "pc_cpu",                 default: ""
    t.string   "pc_ram",                 default: ""
    t.string   "pc_graphic_card",        default: ""
    t.string   "pc_motherboard",         default: ""
    t.string   "pc_keyboard",            default: ""
    t.string   "pc_mouse",               default: ""
    t.string   "pc_mousepad",            default: ""
    t.string   "pc_screen",              default: ""
    t.string   "pc_internet",            default: ""
    t.string   "pc_harddisk",            default: ""
    t.string   "pc_soundcard",           default: ""
    t.string   "pc_cpu_fan",             default: ""
    t.string   "pc_computer_case",       default: ""
    t.string   "pc_alim",                default: ""
    t.string   "pc_os_sytem",            default: ""
    t.string   "pc_smarphone",           default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
