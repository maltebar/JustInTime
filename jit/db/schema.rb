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

ActiveRecord::Schema.define(version: 20150213191936) do

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "active"
    t.boolean  "reveal_1"
    t.boolean  "reveal_2"
    t.boolean  "reveal_3"
    t.float    "percent_1"
    t.float    "percent_2"
    t.float    "percent_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "writer_due"
    t.datetime "promoter_due"
    t.text     "description_2"
    t.text     "description_3"
  end

  create_table "groups", force: true do |t|
    t.boolean  "writer"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "assignment_id"
    t.float    "percentage"
    t.integer  "description_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes",            default: 0
  end

  create_table "ratings", force: true do |t|
    t.boolean  "discuss"
    t.integer  "user_id"
    t.integer  "question_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
