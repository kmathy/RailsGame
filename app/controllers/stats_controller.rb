class StatsController < ApplicationController

  def index

  end

  def best_players
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def best_players_tournament
    respond_to do |format|
      format.html
    end
  end

  def best_players_game
    respond_to do |format|
      format.html
    end
  end
end
