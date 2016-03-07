class MatchesController < ApplicationController
  before_filter -> { find_match params[:id] }, :only => [:show,:update,:edit]

  def show
  end


  def edit
  end

  def update
    @match.score_1 = params[:match][:score_1]
    @match.score_2 = params[:match][:score_2]
    if @match.score_1 > @match.score_2 #player_1 wins
      @match.player_1.increment!(:nb_victory)
      @match.player_2.increment!(:nb_defeat)
      @match.points_1 = 3
      @match.points_2 = 0
      ApplicationMailer.match_lost(@match, @match.player_2).deliver
      ApplicationMailer.match_won(@match, @match.player_1).deliver
    elsif @match.score_1 < @match.score_2 # player_2 wins
      @match.player_1.increment!(:nb_defeat)
      @match.player_2.increment!(:nb_victory)
      @match.points_1 = 0
      @match.points_2 = 3
      ApplicationMailer.match_lost(@match, @match.player_1).deliver
      ApplicationMailer.match_won(@match, @match.player_2).deliver
    else # nobody wins
      @match.points_1 = 1
      @match.points_2 = 1
      ApplicationMailer.match_equality(@match, @match.player_1).deliver
      ApplicationMailer.match_equality(@match, @match.player_2).deliver
    end
    @match.player_1.increment!(:total_points, @match.points_1)
    @match.player_2.increment!(:total_points, @match.points_2)
    if @match.save
      respond_to do |format|
        format.html {redirect_to @match}
        format.js
      end

    end
  end

  def start_matches
    @tournament = Tournament.find(params[:t_id])
    pending_players = PendingPlayer.where("tournament_id = #{params['t_id']}
                      AND game_id = #{params['g_id']}")
    @game = Game.find(params[:g_id])
    array = Array.new
    pending_players.select("player_id").each { |pp|
      array.push(pp.player_id)
    }
    players = array.combination(2).to_a
    players.each { |players_id|
      match = Match.create(:player_1 => User.find(players_id.first), :player_2 => User.find(players_id.second),
                   :tournament_id => params[:t_id], :game_id => params[:g_id])
      @game.matches.push(match)
    }
    pending_players.destroy_all
    respond_to do |format|
      format.html {redirect_to tournament_path(params[:t_id])}
      format.js {render :template => 'tournaments/start_matches.js.erb', :layout => false}
    end
  end

  private

  def find_match(id)
    @match = Match.find(id)
  end
end
