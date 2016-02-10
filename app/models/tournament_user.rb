class TournamentUser < ActiveRecord::Base
  attr_accessible :player_id, :tournament_id
  belongs_to :tournament
  belongs_to :user
end
