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
      @match.player_1.increment(:nb_victory).save
      @match.player_2.increment(:nb_defeat).save
      @match.points_1 = 3
      @match.points_2 = 0
    elsif @match.score_1 < @match.score_2 # player_2 wins
      @match.player_1.increment(:nb_defeat).save
      @match.player_2.increment(:nb_victory).save
      @match.points_1 = 0
      @match.points_2 = 3
    else # nobody wins
      @match.points_1 = 1
      @match.points_2 = 1
    end
    if @match.save
      redirect_to @match
    end
  end

  def start_matches
    pending_players = PendingPlayer.where("tournament_id = #{params['t_id']}
                      AND game_id = #{params['g_id']}")
    array = Array.new
    pending_players.select("player_id").each { |pp|
      array.push(pp.player_id)
    }
    players = array.combination(2).to_a
    players.each { |players_id|
      Match.create(:player_1 => User.find(players_id.first), :player_2 => User.find(players_id.second),
                   :tournament_id => params[:t_id], :game_id => params[:g_id])
    }
    pending_players.destroy_all
    redirect_to tournament_path(:id => params[:t_id])
  end

  private

  def find_match(id)
    @match = Match.find(id)
  end
end
