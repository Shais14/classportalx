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

ActiveRecord::Schema.define(version: 20160226224613) do

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "number"
    t.string   "title"
    t.string   "description"
    t.string   "instructor"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.string   "material"
    t.boolean  "requestedInactive"

  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "content"
    t.integer  "student_id"
    t.integer  "instructor_id"
  end

  add_index "messages", ["instructor_id"], name: "index_messages_on_instructor_id"
  add_index "messages", ["student_id"], name: "index_messages_on_student_id"

  create_table "student_courses", force: :cascade do |t|
    t.string   "grade"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "student_id"
    t.integer  "course_id"
    t.boolean  "enrolled",   default: false
    t.boolean  "requested",  default: true
  end

  add_index "student_courses", ["course_id"], name: "index_student_courses_on_course_id"
  add_index "student_courses", ["student_id"], name: "index_student_courses_on_student_id"

  create_table "user_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "type"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
