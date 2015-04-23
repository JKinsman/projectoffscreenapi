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

ActiveRecord::Schema.define(version: 20150422582424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "username"
    t.integer  "age"
    t.string   "gender"
    t.string   "career"
    t.boolean  "hiking"
    t.boolean  "biking"
    t.boolean  "sports"
    t.boolean  "reading"
    t.boolean  "movies"
    t.boolean  "videogames"
    t.string   "bio"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "friends_enabled"
    t.boolean  "male_friends"
    t.boolean  "female_friends"
    t.boolean  "friends_sports"
    t.boolean  "friends_biking"
    t.boolean  "friends_hiking"
    t.boolean  "friends_reading"
    t.boolean  "friends_movies"
    t.boolean  "friends_videogames"
    t.integer  "friends_min_age"
    t.integer  "friends_max_age"
  end

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
