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

ActiveRecord::Schema.define(version: 20160804055752) do

  create_table "configs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "metric_name"
    t.text     "encrypted_options"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "encrypted_options_iv"
  end

  add_index "configs", ["project_id"], name: "index_configs_on_project_id"

  create_table "metric_samples", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "metric_name"
    t.text     "encrypted_raw_data"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "encrypted_raw_data_iv"
    t.float    "score"
    t.text     "image"
  end

  add_index "metric_samples", ["project_id", "metric_name"], name: "index_metric_samples_on_project_id_and_metric_name"
  add_index "metric_samples", ["project_id"], name: "index_metric_samples_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["name"], name: "index_projects_on_name"

end
