# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_16_082000) do

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "product_name", null: false
    t.text "product_explanation", null: false
    t.integer "category_id", null: false
    t.integer "product_status_id", null: false
    t.integer "shipping_charge_id", null: false
    t.integer "shipping_area_id", null: false
    t.integer "ship_id", null: false
    t.integer "price", null: false
    t.bigint "shipping_addresses_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shipping_addresses_id"], name: "index_products_on_shipping_addresses_id"
  end

end
