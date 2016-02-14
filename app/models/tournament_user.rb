class TournamentUser < ActiveRecord::Base
  attr_accessible :player_id, :tournament_id
  belongs_to :tournament
  belongs_to :user

  validates :tournament_id, :presence => {
      message: 'can\'t be blank'
  }

  validates :player_id, :presence => {
      message: 'can\'t be blank'
  }

end
