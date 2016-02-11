class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :country, :nb_defeat, :nb_victory, :total_points
  attr_accessible :pseudo, :last_name, :first_name, :avatar

  # For avatar
  mount_uploader :avatar, AvatarUploader

  # Associations

  has_many :games, :through => :tournament
  has_many :tournament_users
  has_many :tournaments, :through => :tournament_users

  # Validations

  validates :first_name, :presence => {
      message: 'Can\'t be blank'
  }

  validates :last_name, :presence => {
      message: 'Can\'t be blank'
  }

  validates :pseudo, :presence => {
      message: 'Can\'t be blank'
  }

  validates :pseudo, :length => {
      in: 4...20,
      too_short: 'Minimum %{count} characters',
      too_long: 'Maximum %{count} characters'
  }

  validates :password, :length => {
      in: 4...20,
      too_short: 'Minimum %{count} characters',
      too_long: 'Maximum %{count} characters'
  }

end
