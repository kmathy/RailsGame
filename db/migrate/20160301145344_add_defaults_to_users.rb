class AddDefaultsToUsers < ActiveRecord::Migration
  def change
    remove_columns :users, :nb_victory,:nb_defeat,:total_points,:role
    add_column :users, :nb_victory, :integer, :default => 0
    add_column :users, :nb_defeat, :integer, :default => 0
    add_column :users, :total_points, :integer, :default => 0
    add_column :users, :role, :string, :default => 'player'
  end
end
