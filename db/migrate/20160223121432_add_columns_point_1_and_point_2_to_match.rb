class AddColumnsPoint1AndPoint2ToMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :points
    add_column :matches, :points_1, :integer
    add_column :matches, :points_2, :integer
  end
end
