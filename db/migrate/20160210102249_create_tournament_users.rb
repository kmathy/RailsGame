class CreateTournamentUsers < ActiveRecord::Migration
  def change
    create_table :tournament_users do |t|
      t.integer :player_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
