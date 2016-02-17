class AddAttributesToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :player_1, :integer
    add_column :matches, :player_2, :integer
  end
end
