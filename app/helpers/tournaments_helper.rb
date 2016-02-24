module TournamentsHelper
  def find_player(player)
    User.find(player).pseudo
  end
end
