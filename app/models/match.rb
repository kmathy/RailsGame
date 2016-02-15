class Match < ActiveRecord::Base
  attr_accessible :points, :score, :player_1, :player_2, :tournament_id
  belongs_to :tournament
  has_many :games, :through => :match_game
end
