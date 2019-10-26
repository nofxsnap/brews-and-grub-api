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

ActiveRecord::Schema.define(version: 2019_10_26_154306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "beer_type"
    t.string "beer_sub_type"
    t.decimal "ibu"
    t.decimal "abv"
    t.decimal "price"
    t.integer "ounces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brewery_id"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "street"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.string "image_url"
    t.string "price_range"
    t.json "food"
    t.string "url"
    t.decimal "rating"
    t.integer "review_count"
    t.string "display_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "beers", "breweries"
end
