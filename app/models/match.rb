class Match < ActiveRecord::Base
  attr_accessible :points, :score, :player_1, :player_2
  belongs_to :tournament
end
