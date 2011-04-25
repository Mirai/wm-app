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

ActiveRecord::Schema.define(:version => 20110425213533) do

  create_table "abilities", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "abilities_weapons", :id => false, :force => true do |t|
    t.integer "ability_id"
    t.integer "weapon_id"
  end

  create_table "factions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules_units", :id => false, :force => true do |t|
    t.integer "rule_id"
    t.integer "unit_id"
  end

  create_table "spells", :force => true do |t|
    t.string   "name"
    t.string   "cost"
    t.string   "rng"
    t.string   "aoe"
    t.integer  "pow"
    t.boolean  "up"
    t.boolean  "off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
  end

  create_table "spells_units", :id => false, :force => true do |t|
    t.integer "spell_id"
    t.integer "unit_id"
  end

  create_table "squads", :force => true do |t|
    t.string   "name"
    t.integer  "faction_id"
    t.string   "field_allowance"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "squads_units", :id => false, :force => true do |t|
    t.integer "squad_id"
    t.integer "unit_id"
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
    t.integer  "damage"
    t.string   "field_allowance"
    t.string   "base"
    t.string   "short_name"
  end

  create_table "units_weapons", :id => false, :force => true do |t|
    t.integer "unit_id"
    t.integer "weapon_id"
  end

  create_table "warcasters", :force => true do |t|
    t.string   "focus"
    t.integer  "wj_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feat_name"
    t.text     "feat_desc"
    t.integer  "unit_id"
    t.boolean  "epic"
  end

  create_table "warjacks", :force => true do |t|
    t.integer  "left_hand_id"
    t.integer  "right_hand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
  end

  create_table "weapons", :force => true do |t|
    t.string   "name"
    t.integer  "rng"
    t.integer  "rof"
    t.integer  "aoe"
    t.integer  "pow"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ranged"
  end

end
