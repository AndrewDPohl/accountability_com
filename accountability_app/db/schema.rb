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

ActiveRecord::Schema.define(version: 20150129185931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.json     "latest_bills"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "senators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "date_of_birth"
    t.string   "gender"
    t.string   "political_party"
    t.string   "job_title"
    t.string   "state"
    t.string   "rank"
    t.string   "phone"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "website"
    t.string   "link_to_gov"
    t.string   "twitter_handle"
    t.string   "youtube_id"
    t.string   "cspan_id"
    t.string   "pvsid"
    t.string   "osid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "bioguideid"
    t.integer  "watchlist_id"
    t.string   "full_state_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

end
