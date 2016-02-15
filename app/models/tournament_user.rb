class TournamentUser < ActiveRecord::Base
  attr_accessible :player_id, :tournament_id
  belongs_to :tournament
  belongs_to :user

  validates :tournament_id, :player_id, :presence => {
      message: 'can\'t be blank'
  }

end
