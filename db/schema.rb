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

ActiveRecord::Schema.define(version: 20160724005726) do

  create_table "customers", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "url",                      limit: 255
    t.integer  "current_layout",           limit: 4
    t.integer  "current_confirmation",     limit: 4
    t.integer  "current_invitation",       limit: 4
    t.string   "from_email",               limit: 255
    t.integer  "multiplier",               limit: 4
    t.integer  "default_reservation_size", limit: 4
    t.integer  "table_size",               limit: 4
  end

  create_table "email_configurations", force: :cascade do |t|
    t.integer  "customer_id",       limit: 4
    t.integer  "email_template_id", limit: 4
    t.integer  "field_id",          limit: 4
    t.string   "name",              limit: 255
    t.text     "value",             limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "email_templates", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "html",          limit: 65535
    t.boolean  "use_database"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "email_type_id", limit: 4
  end

  create_table "email_types", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "customer_id",   limit: 4
    t.string   "name",          limit: 255
    t.boolean  "is_vegetarian"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4
    t.integer  "meal_id",        limit: 4
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "reservation_id", limit: 4
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "customer_id",   limit: 4
    t.string   "name",          limit: 255
    t.string   "note",          limit: 255
    t.integer  "party_size",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "address",       limit: 255
    t.string   "city",          limit: 255
    t.string   "state",         limit: 255
    t.string   "zip",           limit: 255
    t.string   "public_id",     limit: 255
    t.boolean  "is_confirmed"
    t.string   "email",         limit: 255
    t.integer  "group_id",      limit: 4
    t.boolean  "email_sent"
    t.boolean  "not_attending"
    t.string   "custom_name",   limit: 255
  end

  add_index "reservations", ["customer_id", "custom_name"], name: "index_reservations_on_customer_id_and_custom_name", unique: true, using: :btree

  create_table "support_comments", force: :cascade do |t|
    t.integer  "support_ticket_id", limit: 4
    t.integer  "user_id",           limit: 4
    t.string   "comment",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "created_by",  limit: 4
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_closed"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "customer_id",      limit: 4
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
    t.string   "remember_digest",  limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_administrator"
  end

end
