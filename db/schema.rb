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

ActiveRecord::Schema.define(version: 20150323075149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_skills", id: false, force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "skill_id",     null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string   "full_name",       null: false
    t.string   "contact_info",    null: false
    t.integer  "status",          null: false
    t.integer  "expected_salary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",        null: false
    t.datetime "valid_to",     null: false
    t.integer  "salary"
    t.text     "contact_info", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vacancy_skills", id: false, force: :cascade do |t|
    t.integer "vacancy_id", null: false
    t.integer "skill_id",   null: false
  end

end
