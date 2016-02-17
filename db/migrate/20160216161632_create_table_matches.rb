class CreateTableMatches < ActiveRecord::Migration
  def change
    create_table :matches
    add_column :matches, :score, :integer
    add_column :matches, :points, :integer
  end
end
