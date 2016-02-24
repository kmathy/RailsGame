class Match < ActiveRecord::Base
  attr_accessible :points_1, :points_2, :score_1, :score_2, :player_1, :player_2, :game_id, :tournament_id
  belongs_to :tournament
  belongs_to :game
  belongs_to :player_1, :class_name => "User", :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => "User", :foreign_key => 'player_2'
end
