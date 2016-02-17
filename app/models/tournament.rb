class Tournament < ActiveRecord::Base

  # Attributes

  attr_accessible :name, :nb_players_max, :place
  attr_accessible :latitude, :longitude

  # Associations

  has_and_belongs_to_many :games, :join_table => 'tournaments_games'
  has_and_belongs_to_many :users
  has_many :matches

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
