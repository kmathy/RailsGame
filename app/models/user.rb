class User < ActiveRecord::Base
  attr_accessible :country, :nb_defeat, :nb_victory, :total_points
  has_many :games, :through => :tournament
  has_many :tournament_users
  has_many :tournaments, :through => :tournament_users
end
