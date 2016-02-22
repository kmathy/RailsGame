class Match < ActiveRecord::Base
  attr_accessible :points, :score_1, :score_2, :player_1, :player_2, :game
  belongs_to :tournament
  belongs_to :game
  belongs_to :player_1, :class_name => "User", :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => "User", :foreign_key => 'player_2'
end
