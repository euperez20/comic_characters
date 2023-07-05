# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_05_023858) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "api_detail_url"
    t.integer "count_of_issue_appearances"
    t.string "deck"
    t.string "description"
    t.string "gender"
    t.string "image"
    t.integer "origin_id"
    t.integer "publisher_id"
    t.string "real_name"
    t.string "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origin_id"], name: "index_characters_on_origin_id"
    t.index ["publisher_id"], name: "index_characters_on_publisher_id"
  end

  create_table "characters_powers", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "power_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_characters_powers_on_character_id"
    t.index ["power_id"], name: "index_characters_powers_on_power_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "powers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters", "origins"
  add_foreign_key "characters", "publishers"
  add_foreign_key "characters_powers", "characters"
  add_foreign_key "characters_powers", "powers"
end
