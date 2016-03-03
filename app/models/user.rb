class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :country, :nb_defeat, :nb_victory, :total_points
  attr_accessible :pseudo, :last_name, :first_name, :avatar, :role
  attr_accessible :matches_1, :matches_2
  attr_accessible :town, :longitude, :latitude

  # geocoder

  geocoded_by :town
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude, :address => :town
  after_validation :reverse_geocode

  #def address
  #  [country, town].compact.join(', ')
  #end

  # Ability constants

  ROLES = %i[admin moderator player]

  # marker

  acts_as_marker

  # For avatar
  mount_uploader :avatar, AvatarUploader

  # Associations

  has_and_belongs_to_many :tournaments
  has_many :matches_1, :class_name => "Match", :foreign_key => 'playerid_1'
  has_many :matches_2, :class_name => "Match", :foreign_key => 'playerid_2'
  has_and_belongs_to_many :games

  # Validations

  validates :first_name, :last_name, :pseudo, :presence => {
      message: 'Can\'t be blank'
  }

  validates :pseudo, :uniqueness => {
      message: 'already exists'
  }

  validates :pseudo, :password, :length => {
      in: 4...20,
      too_short: 'Minimum %{count} characters',
      too_long: 'Maximum %{count} characters'
  }

  # Methods for ability

  def admin?
    self.role == 'admin'
  end

  # Methods for OmniAuth

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
