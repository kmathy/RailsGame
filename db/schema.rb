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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160217101448) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "genre"
  end

  add_index "games", ["description"], :name => "index_games_on_description"
  add_index "games", ["title"], :name => "index_games_on_title"

  create_table "matches", :force => true do |t|
    t.integer "score"
    t.integer "points"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "place"
    t.integer  "nb_players_max"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "date"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "tournaments", ["date"], :name => "index_tournaments_on_date"
  add_index "tournaments", ["latitude", "longitude"], :name => "index_tournaments_on_latitude_and_longitude"
  add_index "tournaments", ["place"], :name => "index_tournaments_on_place"

  create_table "tournaments_games", :force => true do |t|
    t.integer "tournament_id"
    t.integer "game_id"
  end

  add_index "tournaments_games", ["game_id"], :name => "index_tournaments_games_on_game_id"
  add_index "tournaments_games", ["tournament_id"], :name => "index_tournaments_games_on_tournament_id"

  create_table "tournaments_users", :force => true do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  add_index "tournaments_users", ["tournament_id"], :name => "index_tournaments_users_on_tournament_id"
  add_index "tournaments_users", ["user_id"], :name => "index_tournaments_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "country"
    t.integer  "nb_victory"
    t.integer  "nb_defeat"
    t.integer  "total_points"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pseudo"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["pseudo"], :name => "index_users_on_pseudo"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["total_points"], :name => "index_users_on_total_points"

end
