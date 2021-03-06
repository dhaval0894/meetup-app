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

ActiveRecord::Schema.define(version: 20160901131445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "technology"
    t.text     "agenda"
    t.text     "pre_requisite"
    t.string   "venue"
    t.date     "event_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.string   "contact"
    t.text     "suggestion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "speakers", ["event_id"], name: "index_speakers_on_event_id", using: :btree

  add_foreign_key "participants", "events"
  add_foreign_key "speakers", "events"
end
