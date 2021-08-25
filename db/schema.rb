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

ActiveRecord::Schema.define(version: 2021_08_25_085459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compositions", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.boolean "disponibility"
    t.bigint "florist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_title"
    t.index ["florist_id"], name: "index_compositions_on_florist_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "phone"
    t.integer "fidelity_point"
  end

  create_table "florists", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.integer "opening_hours"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "order_compositions", force: :cascade do |t|
    t.integer "quantity"
    t.string "size"
    t.bigint "order_id", null: false
    t.bigint "flower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_id"], name: "index_order_compositions_on_flower_id"
    t.index ["order_id"], name: "index_order_compositions_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price"
    t.boolean "state_order"
    t.bigint "user_id", null: false
    t.bigint "relai_id", null: false
    t.bigint "florist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contact_id", null: false
    t.index ["contact_id"], name: "index_orders_on_contact_id"
    t.index ["florist_id"], name: "index_orders_on_florist_id"
    t.index ["relai_id"], name: "index_orders_on_relai_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "relais", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "phone"
    t.integer "fidelity_point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "compositions", "florists"
  add_foreign_key "order_compositions", "compositions", column: "flower_id"
  add_foreign_key "order_compositions", "orders"
  add_foreign_key "orders", "contacts"
  add_foreign_key "orders", "florists"
  add_foreign_key "orders", "relais"
  add_foreign_key "orders", "users"
end
