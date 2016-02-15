class Tournament < ActiveRecord::Base

  # Attributes

  attr_accessible :name, :nb_players_max, :place, :games, :matches, :users
  attr_accessible :latitude, :longitude

  # Associations

  has_many :tournament_games
  has_many :games, :through => :tournament_games
  has_many :matches
  has_many :tournament_users
  has_many :users, through: :tournament_users

  # Geolocation

  geocoded_by :place
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude, :address => :place
  after_validation :reverse_geocode



  # validations

  validates :name, :nb_players_max, :place, :presence => {
      message: 'can\'t be blank'
  }

  validates :name, :uniqueness => {
      message: 'already exists'
  }

end
