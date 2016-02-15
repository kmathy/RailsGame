class AddIndexToMatchGames < ActiveRecord::Migration
  def change
    add_index :match_games, :match_id
    add_index :match_games, :game_id
    add_index :match_games, [:game_id, :match_id], :unique => true
  end
end
