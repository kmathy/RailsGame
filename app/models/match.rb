class Match < ActiveRecord::Base
  attr_accessible :points, :score

  has_one :tournament
  has_one :game
end
