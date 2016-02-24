class PendingPlayer < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :tournament_id
end
