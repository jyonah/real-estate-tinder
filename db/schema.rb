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

ActiveRecord::Schema.define(version: 20170209033954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "alt_text"
    t.string   "url"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "property_type"
    t.string   "address"
    t.string   "unit"
    t.integer  "price"
    t.integer  "beds"
    t.integer  "baths"
    t.boolean  "pets"
    t.string   "parking"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.json     "pictures"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_rentals_on_user_id", using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "picture"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rental_id"
    t.integer  "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_votes_on_rental_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "rentals", "users"
  add_foreign_key "votes", "rentals"
  add_foreign_key "votes", "users"
end
