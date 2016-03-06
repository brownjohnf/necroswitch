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

ActiveRecord::Schema.define(version: 20160306233224) do

  create_table "api_keys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "switch_uuid"
    t.string   "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ip"
  end

  add_index "events", ["switch_uuid"], name: "index_events_on_switch_uuid", using: :btree

  create_table "switches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uuid",                           null: false
    t.integer  "api_key_id"
    t.string   "name"
    t.string   "email"
    t.string   "sms"
    t.integer  "interval",                       null: false
    t.boolean  "active",          default: true
    t.datetime "last_checked_at"
    t.boolean  "last_check_ok",   default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "switches", ["uuid"], name: "index_switches_on_uuid", unique: true, using: :btree

end
