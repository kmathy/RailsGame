class RemoveTableMatch < ActiveRecord::Migration
  def change
    drop_table :match_games
    drop_table :matches
  end
end
