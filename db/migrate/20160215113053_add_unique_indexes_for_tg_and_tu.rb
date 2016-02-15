class AddUniqueIndexesForTgAndTu < ActiveRecord::Migration
  def change
    add_index :tournament_games, [:game_id, :tournament_id], :unique => true
    add_index :tournament_users, [:player_id, :tournament_id], :unique => true
  end
end
