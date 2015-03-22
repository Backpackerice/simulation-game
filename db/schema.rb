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

ActiveRecord::Schema.define(version: 20150322210942) do

  create_table "assets", force: true do |t|
    t.string   "kind"
    t.integer  "amount"
    t.integer  "period"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  create_table "credits", force: true do |t|
    t.integer  "period"
    t.integer  "game_id"
    t.integer  "principal"
    t.integer  "duration"
    t.decimal  "interest_rate"
    t.boolean  "paid"
    t.integer  "installments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credits", ["game_id"], name: "index_credits_on_game_id"

  create_table "crops", force: true do |t|
    t.string  "type"
    t.integer "quantity"
    t.integer "unit_value", limit: 5
    t.integer "age"
    t.integer "sprayed"
    t.integer "user_id"
    t.integer "harvested",            default: 0
    t.integer "sold",                 default: 0
    t.integer "bought",               default: 0
  end

  add_index "crops", ["user_id"], name: "index_crops_on_user_id"

  create_table "events", force: true do |t|
    t.integer  "period"
    t.string   "action"
    t.text     "message"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  create_table "futures", force: true do |t|
    t.integer  "period"
    t.integer  "game_id"
    t.integer  "settlement_period"
    t.decimal  "price"
    t.string   "contractual_item"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",          default: 0
  end

  create_table "games", force: true do |t|
    t.integer "period"
    t.decimal "cash",    precision: 2, scale: 0
    t.integer "user_id"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "insurances", force: true do |t|
    t.integer  "period"
    t.integer  "game_id"
    t.string   "item"
    t.integer  "quantity"
    t.decimal  "price_per_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insurances", ["game_id"], name: "index_insurances_on_game_id"

  create_table "liabilities", force: true do |t|
    t.string   "kind"
    t.integer  "amount"
    t.integer  "period"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  create_table "lifestocks", force: true do |t|
    t.string  "type"
    t.integer "quantity"
    t.integer "unit_value", limit: 5
    t.integer "age"
    t.integer "vaccinated"
    t.integer "user_id"
    t.integer "butchered",            default: 0
    t.integer "sold",                 default: 0
    t.integer "bought",               default: 0
  end

  add_index "lifestocks", ["user_id"], name: "index_lifestocks_on_user_id"

  create_table "machineries", force: true do |t|
    t.string  "type"
    t.decimal "unit_value",                precision: 5, scale: 0
    t.integer "age"
    t.integer "periods_since_maintenance"
    t.integer "user_id"
    t.integer "sold",                                              default: 0
  end

  add_index "machineries", ["user_id"], name: "index_machineries_on_user_id"

  create_table "personnels", force: true do |t|
    t.string   "position"
    t.integer  "salary"
    t.integer  "quantity"
    t.integer  "period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.integer  "liability_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
