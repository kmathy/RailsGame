class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :country
      t.integer :nb_victory
      t.integer :nb_defeat
      t.integer :total_points

      t.timestamps
    end
  end
end
