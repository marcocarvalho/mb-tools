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

ActiveRecord::Schema.define(version: 20151229190259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "api_tokens", force: :cascade do |t|
    t.uuid     "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.datetime "valid_until"
  end

  add_index "api_tokens", ["token"], name: "index_api_tokens_on_token", unique: true, using: :btree
  add_index "api_tokens", ["user_id"], name: "index_api_tokens_on_user_id", using: :btree

  create_table "trades", force: :cascade do |t|
    t.datetime "date"
    t.float    "price"
    t.float    "amount"
    t.integer  "tid"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trades", ["tid"], name: "index_trades_on_tid", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
