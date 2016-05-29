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

ActiveRecord::Schema.define(version: 20160529075909) do

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
    t.integer  "user_id"
  end

  add_index "osago_calculators", ["user_id"], name: "index_osago_calculators_on_user_id", using: :btree

  create_table "policies", force: :cascade do |t|
    t.integer  "policy_object_id"
    t.string   "policy_object_type"
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
