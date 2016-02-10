class Tournament < ActiveRecord::Base
  attr_accessible :name, :nb_players_max, :place, :games, :matches, :users
  has_many :tournament_games
  has_many :games, :through => :tournament_games
  has_many :matches
  has_many :tournament_users
  has_many :users, through: :tournament_users
end
