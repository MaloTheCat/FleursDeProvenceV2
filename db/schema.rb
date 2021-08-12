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

ActiveRecord::Schema.define(version: 2021_08_12_124245) do

  create_table "florists", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.integer "opening_hours"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flowers", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.boolean "disponibility"
    t.integer "florist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["florist_id"], name: "index_flowers_on_florist_id"
  end

  create_table "order_flowers", force: :cascade do |t|
    t.integer "quantity"
    t.string "size"
    t.integer "order_id", null: false
    t.integer "flower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_id"], name: "index_order_flowers_on_flower_id"
    t.index ["order_id"], name: "index_order_flowers_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price"
    t.boolean "state_order"
    t.integer "user_id", null: false
    t.integer "relai_id", null: false
    t.integer "florist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["florist_id"], name: "index_orders_on_florist_id"
    t.index ["relai_id"], name: "index_orders_on_relai_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "relais", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "flowers", "florists"
  add_foreign_key "order_flowers", "flowers"
  add_foreign_key "order_flowers", "orders"
  add_foreign_key "orders", "florists"
  add_foreign_key "orders", "relais"
  add_foreign_key "orders", "users"
end
