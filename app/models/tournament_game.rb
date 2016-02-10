class TournamentGame < ActiveRecord::Base
  attr_accessible :game_id, :tournament_id
  belongs_to :game
  belongs_to :tournament
end
