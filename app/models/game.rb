class Game < ActiveRecord::Base
  attr_accessible :description, :title, :genre

  markable_as :favorite

  ajaxful_rateable :stars => 10

  has_and_belongs_to_many :tournaments, :join_table => 'tournaments_games'
  has_many :matches
  has_and_belongs_to_many :users

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

end
