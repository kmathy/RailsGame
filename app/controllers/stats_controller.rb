class StatsController < ApplicationController

  def index

  end

  def best_players
    @users = User.all
  end

  def best_players_tournament
    @tournament = Tournament.new
    @users = nil
  end

  def search_tournament
    tournament = Tournament.find(params[:tournament][:id])
    @users = tournament.users
    respond_to do |format|
      format.html {redirect_to best_players_tournament_path}
      format.js {render :search_tournament}
    end
  end

  def best_players_game
    @game = Game.new
    @users = nil
  end

  def search_game
      game = Game.find(params[:game][:id])
      @users = @users.to_h
      game.matches.each do |match|
        unless @users.has_key?(match.player_1.pseudo)
          @users.store(match.player_1.pseudo, 0)
        end
        unless @users.has_key?(match.player_2.pseudo)
          @users.store(match.player_2.pseudo, 0)
        end
        if match.points_1 != nil
          @users["#{match.player_1.pseudo}"] += match.points_1

          @users["#{match.player_2.pseudo}"] += match.points_2
        end
      end
      respond_to do |format|
        format.html {redirect_to best_players_game_path}
        format.js {render :search_game}
      end
  end
end
