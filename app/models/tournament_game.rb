class TournamentGame < ActiveRecord::Base
  attr_accessible :game_id, :tournament_id
  belongs_to :game
  belongs_to :tournament

  validates :game_id, :presence => {
      message: 'can\'t be blank'
  }

  validates :tournament_id, :presence => {
      message: 'can\'t be blank'
  }
end
