class CreateTournamentGames < ActiveRecord::Migration
  def change
    create_table :tournament_games do |t|
      t.integer :tournament_id
      t.integer :game_id

      t.timestamps
    end
  end
end
