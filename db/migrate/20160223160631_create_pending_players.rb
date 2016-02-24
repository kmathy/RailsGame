class CreatePendingPlayers < ActiveRecord::Migration
  def change
    create_table :pending_players do |t|
      t.integer :tournament_id
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
