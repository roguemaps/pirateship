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

ActiveRecord::Schema.define(version: 20140130224157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "formatted_address"
    t.string   "phone"
    t.string   "website"
    t.text     "description"
    t.text     "details"
    t.integer  "price_level"
    t.string   "facebook_page"
    t.integer  "city_id"
    t.decimal  "lat",                      precision: 10, scale: 6
    t.decimal  "lng",                      precision: 10, scale: 6
    t.boolean  "active",                                            default: false
    t.integer  "created_by",                                        default: 1
    t.integer  "updated_by",                                        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  add_index "businesses", ["category"], name: "index_businesses_on_category", using: :btree
  add_index "businesses", ["city_id"], name: "index_businesses_on_city_id", using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree

  create_table "businesses_tags", id: false, force: true do |t|
    t.integer "business_id", null: false
    t.integer "tag_id",      null: false
  end

  add_index "businesses_tags", ["business_id", "tag_id"], name: "index_businesses_tags_on_business_id_and_tag_id", using: :btree
  add_index "businesses_tags", ["tag_id", "business_id"], name: "index_businesses_tags_on_tag_id_and_business_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "country_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree
  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "alpha_2",    limit: 2
    t.string   "alpha_3",    limit: 3
    t.string   "numeric",    limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbr",       limit: 5
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.boolean  "filterable", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
