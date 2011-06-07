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

ActiveRecord::Schema.define(:version => 20110607151338) do

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

  create_table "damage_grids", :force => true do |t|
    t.string   "name"
    t.string   "one_1"
    t.string   "one_2"
    t.string   "one_3"
    t.string   "one_4"
    t.string   "one_5"
    t.string   "one_6"
    t.string   "two_1"
    t.string   "two_2"
    t.string   "two_3"
    t.string   "two_4"
    t.string   "two_5"
    t.string   "two_6"
    t.string   "three_1"
    t.string   "three_2"
    t.string   "three_3"
    t.string   "three_4"
    t.string   "three_5"
    t.string   "three_6"
    t.string   "four_1"
    t.string   "four_2"
    t.string   "four_3"
    t.string   "four_4"
    t.string   "four_5"
    t.string   "four_6"
    t.string   "five_1"
    t.string   "five_2"
    t.string   "five_3"
    t.string   "five_4"
    t.string   "five_5"
    t.string   "five_6"
    t.string   "six_1"
    t.string   "six_2"
    t.string   "six_3"
    t.string   "six_4"
    t.string   "six_5"
    t.string   "six_6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equips", :force => true do |t|
    t.integer  "model_id"
    t.integer  "weapon_id"
    t.boolean  "x2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hand"
  end

  create_table "factions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_orders", :force => true do |t|
    t.integer  "model_id"
    t.integer  "order_id"
    t.integer  "skill_check"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", :force => true do |t|
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
    t.integer  "model_type_id"
    t.integer  "faction_id"
    t.integer  "damage"
    t.string   "field_allowance"
    t.string   "base"
    t.string   "short_name"
    t.integer  "sub_type_id"
    t.string   "add_name"
    t.integer  "add_stat"
    t.boolean  "cavalry"
    t.integer  "parent_id"
  end

  create_table "models_spells", :id => false, :force => true do |t|
    t.integer "spell_id"
    t.integer "model_id"
  end

  create_table "models_units", :id => false, :force => true do |t|
    t.integer "unit_id"
    t.integer "model_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "multi"
  end

  create_table "rules", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
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
    t.text     "desc"
  end

  create_table "sub_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "faction_id"
    t.string   "field_allowance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "min_models"
    t.string   "min_cost"
    t.string   "max_models"
    t.string   "max_cost"
    t.integer  "unit_type_id"
    t.boolean  "unit_attachment"
    t.boolean  "weapon_attachment"
    t.integer  "sub_type_id"
    t.boolean  "cavalry"
    t.integer  "attachment_id"
  end

  create_table "warcasters", :force => true do |t|
    t.string   "focus"
    t.integer  "wj_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feat_name"
    t.text     "feat_desc"
    t.integer  "model_id"
    t.boolean  "epic"
  end

  create_table "warjacks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
    t.integer  "damage_grid_id"
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
    t.boolean  "spray"
  end

end
