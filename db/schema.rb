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

ActiveRecord::Schema.define(version: 20160427202222) do

  create_table "car_horse_powers", force: :cascade do |t|
    t.string   "description", limit: 255
    t.float    "rate",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "rate",             limit: 4
    t.boolean  "tractor"
    t.integer  "trailer_category", limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.float    "car_rate",     limit: 24
    t.float    "tractor_rate", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "osago_calculators", force: :cascade do |t|
    t.integer  "city_id",            limit: 4
    t.integer  "drivers_count",      limit: 4,  default: 0
    t.integer  "driver_experience",  limit: 4,  default: 0
    t.integer  "car_id",             limit: 4
    t.integer  "car_horse_power_id", limit: 4
    t.boolean  "trailer",                       default: false
    t.boolean  "with_accidents",                default: false
    t.float    "cost",               limit: 24
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

end
