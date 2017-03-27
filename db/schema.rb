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

ActiveRecord::Schema.define(version: 20150602232117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.uuid     "organization_id",                     null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "accounts", ["confirmation_sent_at"], name: "index_accounts_on_confirmation_sent_at", using: :btree
  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "accounts", ["confirmed_at"], name: "index_accounts_on_confirmed_at", using: :btree
  add_index "accounts", ["created_at"], name: "index_accounts_on_created_at", using: :btree
  add_index "accounts", ["current_sign_in_at"], name: "index_accounts_on_current_sign_in_at", using: :btree
  add_index "accounts", ["deleted_at"], name: "index_accounts_on_deleted_at", using: :btree
  add_index "accounts", ["email", "organization_id"], name: "index_accounts_on_email_and_organization_id", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", using: :btree
  add_index "accounts", ["failed_attempts"], name: "index_accounts_on_failed_attempts", using: :btree
  add_index "accounts", ["last_sign_in_at"], name: "index_accounts_on_last_sign_in_at", using: :btree
  add_index "accounts", ["locked_at"], name: "index_accounts_on_locked_at", using: :btree
  add_index "accounts", ["organization_id"], name: "index_accounts_on_organization_id", using: :btree
  add_index "accounts", ["remember_created_at"], name: "index_accounts_on_remember_created_at", using: :btree
  add_index "accounts", ["reset_password_sent_at"], name: "index_accounts_on_reset_password_sent_at", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "accounts", ["unconfirmed_email"], name: "index_accounts_on_unconfirmed_email", using: :btree
  add_index "accounts", ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true, using: :btree

  create_table "banks", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",            default: "", null: false
    t.string   "public",          default: "", null: false
    t.string   "private",         default: "", null: false
    t.uuid     "organization_id",              null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "banks", ["deleted_at"], name: "index_banks_on_deleted_at", using: :btree
  add_index "banks", ["name", "organization_id"], name: "index_banks_on_name_and_organization_id", unique: true, using: :btree
  add_index "banks", ["name"], name: "index_banks_on_name", using: :btree
  add_index "banks", ["organization_id"], name: "index_banks_on_organization_id", using: :btree
  add_index "banks", ["private"], name: "index_banks_on_private", using: :btree
  add_index "banks", ["public"], name: "index_banks_on_public", using: :btree

  create_table "incomes", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "amount",          default: 0, null: false
    t.integer  "rate",            default: 0, null: false
    t.uuid     "bank_id",                     null: false
    t.uuid     "organization_id",             null: false
    t.date     "start_at",                    null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "incomes", ["amount"], name: "index_incomes_on_amount", using: :btree
  add_index "incomes", ["bank_id"], name: "index_incomes_on_bank_id", using: :btree
  add_index "incomes", ["created_at"], name: "index_incomes_on_created_at", using: :btree
  add_index "incomes", ["deleted_at"], name: "index_incomes_on_deleted_at", using: :btree
  add_index "incomes", ["name", "organization_id"], name: "index_incomes_on_name_and_organization_id", unique: true, using: :btree
  add_index "incomes", ["name"], name: "index_incomes_on_name", using: :btree
  add_index "incomes", ["organization_id"], name: "index_incomes_on_organization_id", using: :btree
  add_index "incomes", ["rate"], name: "index_incomes_on_rate", using: :btree
  add_index "incomes", ["start_at"], name: "index_incomes_on_start_at", using: :btree

  create_table "organizations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "organizations", ["created_at"], name: "index_organizations_on_created_at", using: :btree
  add_index "organizations", ["deleted_at"], name: "index_organizations_on_deleted_at", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true, using: :btree
  add_index "organizations", ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree

  create_table "transactions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "amount",          default: 0,  null: false
    t.string   "note",            default: "", null: false
    t.uuid     "bank_id",                      null: false
    t.uuid     "income_id"
    t.uuid     "organization_id",              null: false
    t.date     "applied_at",                   null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "transactions", ["amount"], name: "index_transactions_on_amount", using: :btree
  add_index "transactions", ["applied_at"], name: "index_transactions_on_applied_at", using: :btree
  add_index "transactions", ["bank_id"], name: "index_transactions_on_bank_id", using: :btree
  add_index "transactions", ["deleted_at"], name: "index_transactions_on_deleted_at", using: :btree
  add_index "transactions", ["income_id"], name: "index_transactions_on_income_id", using: :btree
  add_index "transactions", ["organization_id"], name: "index_transactions_on_organization_id", using: :btree

end
