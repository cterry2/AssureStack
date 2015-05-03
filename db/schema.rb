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

ActiveRecord::Schema.define(version: 20150503003611) do

  create_table "answercomments", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.text     "answercommenttext"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "issue_id"
    t.text     "answertext"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issuecomments", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.text     "issuecommenttext"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "views"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scorelogs", force: :cascade do |t|
    t.integer  "answerid"
    t.integer  "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userkeywords", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
