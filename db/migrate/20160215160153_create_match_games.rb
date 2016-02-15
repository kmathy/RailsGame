class CreateMatchGames < ActiveRecord::Migration
  def change
    drop_table :match_game
    create_table :match_games do |t|
      t.integer :match_id
      t.integer :game_id

      t.timestamps
    end
  end
end
