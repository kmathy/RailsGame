class Indexes < ActiveRecord::Migration
  def change
    add_index :games, :title
    add_index :games, :description

    add_index :tournaments, :place
    add_column :tournaments, :date, :datetime
    add_index :tournaments, :date

    add_index :matches, :player_1
    add_index :matches, :player_2

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :pseudo, :string
    add_index :users, :pseudo
    add_column :users, :email, :string
    add_index :users, :total_points

    add_index :tournament_users, :player_id
    add_index :tournament_users, :tournament_id

    add_index :tournament_games, :game_id
    add_index :tournament_games, :tournament_id

  end
end
