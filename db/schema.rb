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

ActiveRecord::Schema.define(version: 20160601030417) do

  create_table "abilities", force: :cascade do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "retire_id"
    t.boolean  "is_valid"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "applications", ["retire_id"], name: "index_applications_on_retire_id"
  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "cvs", force: :cascade do |t|
    t.integer  "ability_id"
    t.integer  "retire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cvs", ["ability_id"], name: "index_cvs_on_ability_id"
  add_index "cvs", ["retire_id"], name: "index_cvs_on_retire_id"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "evaluations", ["application_id"], name: "index_evaluations_on_application_id"
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id"

  create_table "retires", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "retires", ["user_id"], name: "index_retires_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "sex"
    t.datetime "birthday"
    t.string   "city"
    t.string   "commune"
    t.string   "state"
    t.text     "linkedin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
