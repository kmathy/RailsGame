class ChangeNameTable < ActiveRecord::Migration
  def change

    create_table :tournaments_users
    add_column :tournaments_users, :tournament_id, :integer
    add_column :tournaments_users, :user_id, :integer

    add_index :tournaments_users, :tournament_id
    add_index :tournaments_users, :user_id


    create_table :tournaments_games
    add_column :tournaments_games, :tournament_id, :integer
    add_column :tournaments_games, :game_id, :integer

    add_index :tournaments_games, :tournament_id
    add_index :tournaments_games, :game_id
  end
end
