class AddIndexForGeocoding < ActiveRecord::Migration
  def change
    add_index :tournaments, [:latitude, :longitude]
  end
end
