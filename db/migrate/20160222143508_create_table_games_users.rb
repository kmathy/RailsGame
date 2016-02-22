class CreateTableGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users
    add_column :games_users, :game_id, :integer
    add_column :games_users, :user_id, :integer
  end
end
