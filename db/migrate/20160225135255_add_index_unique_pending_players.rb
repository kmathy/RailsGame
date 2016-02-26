class AddIndexUniquePendingPlayers < ActiveRecord::Migration
  def change
    add_index :pending_players, [:tournament_id, :game_id, :player_id], :unique => true, :name => 'index_unique_game_tournament_player_IDs'
  end
end
