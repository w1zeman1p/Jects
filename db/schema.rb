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

ActiveRecord::Schema.define(version: 20140802171304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "url"
    t.string   "gitrepo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count", default: 0
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "generated",  default: false
  end

  add_index "repos", ["user_id"], name: "index_repos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider",                      null: false
    t.string   "uid",                           null: false
    t.string   "login",                         null: false
    t.string   "name",                          null: false
    t.string   "email",                         null: false
    t.string   "image",                         null: false
    t.string   "session_token",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count",   default: 0
    t.boolean  "admin",         default: false
    t.string   "token"
  end

  create_table "votes", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["project_id", "user_id"], name: "index_votes_on_project_id_and_user_id", unique: true, using: :btree

end
