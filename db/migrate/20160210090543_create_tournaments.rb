class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :place
      t.integer :nb_players_max

      t.timestamps
    end
  end
end
