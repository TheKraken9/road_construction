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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_073549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formula", id: :serial, force: :cascade do |t|
    t.serial "idnationalroute", null: false
    t.text "quality"
  end

  create_table "fusions", id: false, force: :cascade do |t|
    t.string "name", limit: 50
    t.float "penalty"
    t.float "speed"
    t.integer "emp"
    t.float "price"
    t.float "anc"
    t.float "formulas"
  end

  create_table "providers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.float "speed"
    t.integer "emp"
    t.date "birthday"
    t.float "penalty"
    t.float "price"
  end

  create_table "rns", id: :serial, force: :cascade do |t|
    t.string "name", limit: 10
    t.string "begin_km", limit: 50
    t.string "end_km", limit: 50
    t.integer "pk_begin"
    t.integer "pk_end"
    t.float "length"
  end

  create_table "roads", id: :serial, force: :cascade do |t|
    t.integer "idrns"
    t.float "begin_pk"
    t.float "end_pk"
    t.float "width"
    t.float "profondeur"
  end

  add_foreign_key "formula", "rns", column: "idnationalroute", name: "formula_idnationalroute_fkey"
  add_foreign_key "roads", "rns", column: "idrns", name: "roads_idrns_fkey"
end
