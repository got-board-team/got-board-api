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

ActiveRecord::Schema.define(version: 20160606222125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "citext"

  create_table "boards", force: :cascade do |t|
    t.integer  "match_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["match_id"], name: "index_boards_on_match_id", using: :btree

  create_table "garrisons", force: :cascade do |t|
    t.string   "name"
    t.integer  "match_id"
    t.string   "territory"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "garrisons", ["match_id"], name: "index_garrisons_on_match_id", using: :btree

  create_table "house_cards", force: :cascade do |t|
    t.string   "name",                         null: false
    t.integer  "x",            default: 0,     null: false
    t.integer  "y",            default: 0,     null: false
    t.boolean  "faceup",       default: false, null: false
    t.datetime "discarted_at"
    t.integer  "player_id",                    null: false
    t.integer  "board_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "map_areas", force: :cascade do |t|
    t.integer  "match_id",                       null: false
    t.integer  "map_id",                         null: false
    t.citext   "slug",                           null: false
    t.string   "type",                           null: false
    t.string   "fortification_type"
    t.integer  "barrels_count",      default: 0, null: false
    t.integer  "crowns_count",       default: 0, null: false
    t.string   "house_sigil"
    t.integer  "port_owner_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "map_areas", ["map_id", "slug"], name: "index_map_areas_on_map_id_and_slug", unique: true, using: :btree
  add_index "map_areas", ["map_id"], name: "index_map_areas_on_map_id", using: :btree
  add_index "map_areas", ["match_id"], name: "index_map_areas_on_match_id", using: :btree
  add_index "map_areas", ["port_owner_id"], name: "index_map_areas_on_port_owner_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at",                                                                                      null: false
    t.datetime "updated_at",                                                                                      null: false
    t.integer  "round",             default: 1,                                                                   null: false
    t.string   "iron_throne_track", default: ["baratheon", "lannister", "stark", "greyjoy", "tyrell", "martell"],              array: true
    t.string   "fiefdoms_track",    default: ["baratheon", "lannister", "stark", "greyjoy", "martell", "tyrell"],              array: true
    t.string   "kings_court_track", default: ["lannister", "baratheon", "stark", "greyjoy", "tyrell", "martell"],              array: true
  end

  create_table "order_tokens", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "player_id"
    t.string   "type"
    t.string   "territory"
    t.integer  "x"
    t.integer  "y"
    t.boolean  "faceup",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "match_id",         null: false
    t.string   "house",            null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "supply_position"
    t.integer  "victory_position"
    t.integer  "throne_position"
    t.integer  "blade_position"
    t.integer  "raven_position"
  end

  add_index "players", ["blade_position", "match_id"], name: "index_players_on_blade_position_and_match_id", unique: true, using: :btree
  add_index "players", ["match_id", "house"], name: "index_players_on_match_id_and_house", unique: true, using: :btree
  add_index "players", ["match_id"], name: "index_players_on_match_id", using: :btree
  add_index "players", ["raven_position", "match_id"], name: "index_players_on_raven_position_and_match_id", unique: true, using: :btree
  add_index "players", ["throne_position", "match_id"], name: "index_players_on_throne_position_and_match_id", unique: true, using: :btree

  create_table "power_tokens", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "player_id"
    t.string   "territory"
    t.integer  "x",          default: 0, null: false
    t.integer  "y",          default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "power_tokens", ["board_id"], name: "index_power_tokens_on_board_id", using: :btree
  add_index "power_tokens", ["player_id"], name: "index_power_tokens_on_player_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.integer  "match_id",                null: false
    t.integer  "board_id",                null: false
    t.string   "type",                    null: false
    t.json     "slots",      default: [], null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tracks", ["board_id"], name: "index_tracks_on_board_id", using: :btree
  add_index "tracks", ["match_id"], name: "index_tracks_on_match_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "player_id"
    t.string   "type"
    t.string   "territory"
    t.integer  "x"
    t.integer  "y"
    t.boolean  "routed",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "units", ["board_id"], name: "index_units_on_board_id", using: :btree
  add_index "units", ["player_id"], name: "index_units_on_player_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "power_tokens", "boards"
  add_foreign_key "power_tokens", "players"
  add_foreign_key "units", "boards"
  add_foreign_key "units", "players"
end
