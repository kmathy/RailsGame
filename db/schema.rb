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

ActiveRecord::Schema.define(:version => 20160225135255) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "genre"
    t.integer  "user_id"
  end

  add_index "games", ["description"], :name => "index_games_on_description"
  add_index "games", ["title"], :name => "index_games_on_title"

  create_table "games_users", :force => true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "matches", :force => true do |t|
    t.integer "player_1"
    t.integer "player_2"
    t.integer "score_1"
    t.integer "score_2"
    t.integer "game_id"
    t.integer "tournament_id"
    t.integer "points_1"
    t.integer "points_2"
  end

  create_table "pending_players", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "pending_players", ["tournament_id", "game_id", "player_id"], :name => "index_unique_game_tournament_player_IDs", :unique => true

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

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
    t.integer  "nb_victory",             :default => 0
    t.integer  "nb_defeat",              :default => 0
    t.integer  "total_points",           :default => 0
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
    t.string   "role",                   :default => "player"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["pseudo"], :name => "index_users_on_pseudo"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["total_points"], :name => "index_users_on_total_points"

end
