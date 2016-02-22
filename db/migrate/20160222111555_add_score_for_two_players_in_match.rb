class AddScoreForTwoPlayersInMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :score
    add_column :matches, :score_1, :integer
    add_column :matches, :score_2, :integer
  end
end
