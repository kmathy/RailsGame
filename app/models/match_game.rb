class MatchGame < ActiveRecord::Base
  attr_accessible :game_id, :match_id

  belongs_to :game
  belongs_to :match
end
