class Match < ActiveRecord::Base
  attr_accessible :points, :score, :player_1, :player_2
  belongs_to :tournament
  has_one :game
  belongs_to :player_1, :class_name => "User", :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => "User", :foreign_key => 'player_2'
end
