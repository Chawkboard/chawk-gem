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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chawk_agents", force: true do |t|
    t.integer  "foreign_id"
    t.string   "name",       limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chawk_nodes", force: true do |t|
    t.string  "key",          limit: 150
    t.text    "decription"
    t.boolean "public_read",              default: false
    t.boolean "public_write",             default: false
  end

  create_table "chawk_points", force: true do |t|
    t.float    "observed_at"
    t.datetime "recorded_at"
    t.text     "meta"
    t.integer  "value"
    t.integer  "node_id",     null: false
  end

  add_index "chawk_points", ["node_id"], name: "index_chawk_points_node", using: :btree

  create_table "chawk_relations", force: true do |t|
    t.boolean "admin",    default: false
    t.boolean "read",     default: false
    t.boolean "write",    default: false
    t.integer "agent_id",                 null: false
    t.integer "node_id",                  null: false
  end

  add_index "chawk_relations", ["agent_id"], name: "index_chawk_relations_agent", using: :btree
  add_index "chawk_relations", ["node_id"], name: "index_chawk_relations_node", using: :btree

  create_table "chawk_values", force: true do |t|
    t.float    "observed_at"
    t.datetime "recorded_at"
    t.text     "meta"
    t.text     "value"
    t.integer  "node_id",     null: false
  end

  add_index "chawk_values", ["node_id"], name: "index_chawk_values_node", using: :btree

end
