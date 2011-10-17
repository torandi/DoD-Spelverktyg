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

ActiveRecord::Schema.define(:version => 20111017214001) do

  create_table "attributes", :force => true do |t|
    t.string   "name"
    t.string   "text_id",                     :null => false
    t.string   "base_formula",                :null => false
    t.integer  "output_type",  :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attributes", ["text_id"], :name => "index_attributes_on_text_id", :unique => true

  create_table "character_skill_levels", :force => true do |t|
    t.integer  "character_id"
    t.integer  "skill_tree_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_skills", :force => true do |t|
    t.integer  "character_id"
    t.integer  "skill_id"
    t.integer  "specialization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.integer  "gameleader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_trees", :force => true do |t|
    t.string   "name"
    t.string   "skill_model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "skill_tree_id"
    t.integer  "level"
    t.string   "attr"
    t.string   "formula"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "class_limited", :default => false, :null => false
    t.integer  "dependency_id"
  end

  create_table "spell_trees", :force => true do |t|
    t.string   "name"
    t.string   "hvita_effect"
    t.string   "vaagri_effect"
    t.string   "mork_effect"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",              :default => "user"
    t.string   "persistence_token",                     :null => false
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
