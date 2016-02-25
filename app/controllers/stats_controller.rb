class StatsController < ApplicationController

  def index
    @game = best_game
    @users = User.all
    stat_general
  end

  private

  def best_game

  end

  def stat_general

  end
end
