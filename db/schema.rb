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

ActiveRecord::Schema.define(:version => 20160210105447) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "games", ["description"], :name => "index_games_on_description"
  add_index "games", ["title"], :name => "index_games_on_title"

  create_table "matches", :force => true do |t|
    t.integer  "score"
    t.integer  "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "player_1"
    t.integer  "player_2"
  end

  add_index "matches", ["player_1"], :name => "index_matches_on_player_1"
  add_index "matches", ["player_2"], :name => "index_matches_on_player_2"

  create_table "tournament_games", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "game_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tournament_games", ["game_id"], :name => "index_tournament_games_on_game_id"
  add_index "tournament_games", ["tournament_id"], :name => "index_tournament_games_on_tournament_id"

  create_table "tournament_users", :force => true do |t|
    t.integer  "player_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tournament_users", ["player_id"], :name => "index_tournament_users_on_player_id"
  add_index "tournament_users", ["tournament_id"], :name => "index_tournament_users_on_tournament_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "place"
    t.integer  "nb_players_max"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "date"
  end

  add_index "tournaments", ["date"], :name => "index_tournaments_on_date"
  add_index "tournaments", ["place"], :name => "index_tournaments_on_place"

  create_table "users", :force => true do |t|
    t.string   "country"
    t.integer  "nb_victory"
    t.integer  "nb_defeat"
    t.integer  "total_points"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pseudo"
    t.string   "email"
  end

  add_index "users", ["pseudo"], :name => "index_users_on_pseudo"
  add_index "users", ["total_points"], :name => "index_users_on_total_points"

end
