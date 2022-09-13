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

ActiveRecord::Schema[7.0].define(version: 2022_09_12_140228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "currency_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_code"], name: "index_currencies_on_currency_code"
  end

  create_table "frames", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status", default: 1
    t.integer "stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glasses", force: :cascade do |t|
    t.bigint "frame_id"
    t.bigint "lense_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_id"], name: "index_glasses_on_frame_id"
    t.index ["lense_id"], name: "index_glasses_on_lense_id"
    t.index ["user_id"], name: "index_glasses_on_user_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "colour"
    t.string "description"
    t.string "prescription_type"
    t.string "lens_type"
    t.integer "stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.float "price"
    t.string "currency_code"
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_code"], name: "index_prices_on_currency_code"
    t.index ["entity_type", "entity_id"], name: "index_prices_on_entity"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_roles_on_uid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.datetime "authentication_token_updated_at"
    t.integer "role_id"
    t.string "currency_code", default: "usd", null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
