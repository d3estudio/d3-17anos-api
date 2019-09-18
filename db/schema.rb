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

ActiveRecord::Schema.define(version: 2019_09_18_171357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkins", force: :cascade do |t|
    t.bigint "guest_id"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_checkins_on_guest_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "slug"
    t.string "tag_nfc"
    t.string "name"
    t.string "nickname"
    t.string "description"
    t.string "greeting"
    t.string "phone"
    t.string "address"
    t.string "address_number"
    t.string "address_complement"
    t.string "zip"
    t.string "city"
    t.string "state"
    t.string "picture"
    t.string "email"
    t.integer "bond"
    t.datetime "joined_at"
    t.datetime "left_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["slug"], name: "index_guests_on_slug", unique: true
    t.index ["tag_nfc"], name: "index_guests_on_tag_nfc", unique: true
  end

  add_foreign_key "checkins", "guests"
end
