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

ActiveRecord::Schema.define(version: 20160901131436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string   "name"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "course_attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_attachments_on_course_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",             precision: 10, scale: 2, default: "0.0"
    t.text     "short_description"
    t.text     "description"
    t.string   "group"
    t.integer  "language_id"
    t.integer  "status"
    t.integer  "since_activation",                           default: 0
    t.integer  "since_started",                              default: 0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.index ["language_id"], name: "index_courses_on_language_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "language_id"
    t.string   "title"
    t.string   "url"
    t.string   "page_content"
    t.string   "meta_description"
    t.string   "meta_title"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["language_id"], name: "index_pages_on_language_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.integer  "course_id"
    t.integer  "question_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "question_content"
    t.index ["course_id"], name: "index_questions_on_course_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_day"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "course_attachments", "courses"
  add_foreign_key "courses", "languages"
  add_foreign_key "questions", "courses"
end
