class Game < ActiveRecord::Base
  attr_accessible :description, :title, :genre
  has_and_belongs_to_many :tournaments
  belongs_to :match

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
