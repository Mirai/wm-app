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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110414194158) do

  create_table "factions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feats", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "rng"
    t.integer  "aoe"
    t.integer  "pow"
    t.boolean  "up"
    t.boolean  "off"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "spd"
    t.integer  "str"
    t.integer  "mat"
    t.integer  "rat"
    t.integer  "def"
    t.integer  "arm"
    t.integer  "cmd"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_type_id"
    t.integer  "faction_id"
  end

  create_table "weapons", :force => true do |t|
    t.string   "name"
    t.string   "hand"
    t.integer  "wtype"
    t.integer  "rng"
    t.integer  "rof"
    t.integer  "aoe"
    t.integer  "pow"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
