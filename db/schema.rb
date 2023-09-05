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

ActiveRecord::Schema[7.0].define(version: 2023_09_05_125917) do
  create_table "accounts", force: :cascade do |t|
    t.string "description", null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledger_transactions", force: :cascade do |t|
    t.string "activity_id", null: false
    t.datetime "date", null: false
    t.string "transaction_type", null: false
    t.string "method", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.decimal "balance", precision: 10, scale: 2, null: false
    t.integer "requester_id"
    t.integer "source_id"
    t.integer "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_ledger_transactions_on_account_id"
    t.index ["destination_id"], name: "index_ledger_transactions_on_destination_id"
    t.index ["requester_id"], name: "index_ledger_transactions_on_requester_id"
    t.index ["source_id"], name: "index_ledger_transactions_on_source_id"
  end

  create_table "transaction_parties", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ledger_transactions", "accounts"
  add_foreign_key "ledger_transactions", "transaction_parties", column: "destination_id"
  add_foreign_key "ledger_transactions", "transaction_parties", column: "requester_id"
  add_foreign_key "ledger_transactions", "transaction_parties", column: "source_id"
end
