class ChangeGamesType < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.remove :type
      t.string :genre
    end
  end
end
