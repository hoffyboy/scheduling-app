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

ActiveRecord::Schema.define(version: 20171029081348) do

  create_table "acts_as_bookable_bookings", force: :cascade do |t|
    t.string   "bookable_type"
    t.integer  "bookable_id"
    t.string   "booker_type"
    t.integer  "booker_id"
    t.integer  "amount"
    t.text     "schedule"
    t.datetime "time"
    t.datetime "created_at"
    t.index ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable"
    t.index ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "primary"
    t.string   "secondary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "schedule"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
