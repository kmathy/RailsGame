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

  # Ability constants

  ROLES = %i[admin moderator player]

  # For avatar
  mount_uploader :avatar, AvatarUploader

  # Associations

  has_many :games, :through => :tournament
  has_many :tournament_users
  has_many :tournaments, :through => :tournament_users

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
