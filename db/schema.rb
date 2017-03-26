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

ActiveRecord::Schema.define(version: 20170323161034) do

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.boolean  "confirmed"
    t.string   "confirm_token"
    t.integer  "employer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["employer_id"], name: "index_emails_on_employer_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.boolean  "gender"
    t.string   "location"
    t.string   "dob"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "phone"
    t.integer  "pin",         default: 9494
    t.datetime "pin_sent_at"
    t.boolean  "verified",    default: false
    t.integer  "employer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["employer_id"], name: "index_phones_on_employer_id"
  end

end
