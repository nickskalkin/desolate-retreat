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

ActiveRecord::Schema.define(version: 20160526195310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_horse_powers", force: :cascade do |t|
    t.string   "description"
    t.float    "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "title"
    t.integer  "rate"
    t.boolean  "tractor"
    t.integer  "trailer_category", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "rate_max",         default: 0
    t.integer  "trailer_rate",     default: 1
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.float    "car_rate"
    t.float    "tractor_rate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "osago_calculators", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "drivers_count",                default: 0
    t.integer  "driver_experience",            default: 0
    t.integer  "car_id"
    t.integer  "car_horse_power_id"
    t.boolean  "trailer",                      default: false
    t.boolean  "with_accidents",               default: false
    t.float    "cost"
    t.integer  "insurance_period"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "bonus_malun",        limit: 3, default: "M"
    t.float    "cost_max",                     default: 0.0
  end

end
