class Game < ActiveRecord::Base
  attr_accessible :description, :title, :genre
  has_many :tournament_games
  has_many :tournaments, :through => :tournament_games
  has_many :users, :through => :tournaments

  validates :description, :presence => {
      message: 'Can\'t be blank'
  }

  validates :title, :presence => {
      message: 'Can\'t be blank'
  }

  validates :genre, :presence => {
      message: 'Can\'t be blank'
  }

  validates :title, :uniqueness => {
      message: 'already exists'
  }

  validates :genre, :uniqueness => {
      message: 'already exists'
  }

end
