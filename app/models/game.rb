class Game < ActiveRecord::Base
  attr_accessible :description, :title, :genre
  has_many :tournament_games
  has_many :tournaments, :through => :tournament_games
  has_many :users, :through => :tournaments

end
