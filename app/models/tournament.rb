class Tournament < ActiveRecord::Base
  attr_accessible :name, :nb_players_max, :place, :games, :matches, :users
  has_many :tournament_games
  has_many :games, :through => :tournament_games
  has_many :matches
  has_many :tournament_users
  has_many :users, through: :tournament_users

  validates :name, :presence => {
      message: 'can\'t be blank'
  }

  validates :nb_players_max, :presence => {
      message: 'can\'t be blank'
  }

  validates :place, :presence => {
      message: 'can\'t be blank'
  }

  validates :name, :uniqueness => {
      message: 'already exists'
  }

end
