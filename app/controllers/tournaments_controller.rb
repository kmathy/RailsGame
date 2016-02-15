class TournamentsController < ApplicationController
  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournaments }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournament = Tournament.find(params[:id])

    @games = list_games(@tournament)

    @players = list_players(@tournament)

    @matches = list_matches(@tournament)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/new
  # GET /tournaments/new.json
  def new
    @tournament = Tournament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament }
    end
  end

  # GET /tournaments/1/edit
  def edit
    @tournament = Tournament.find(params[:id])
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(params[:tournament])

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render json: @tournament, status: :created, location: @tournament }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournaments/1
  # PUT /tournaments/1.json
  def update
    @tournament = Tournament.find(params[:id])

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament = Tournament.find(params[:id])
    TournamentGame.destroy_all(:tournament_id => @tournament.id)
    TournamentUser.destroy_all(:tournament_id => @tournament.id)
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end

  # POST /add_player
  def add_player
    t_id = params[:tournament][:tournament_id]
    t_u = TournamentUser.new(:player_id => session['warden.user.user.key'][0][0],
                             :tournament_id => t_id)
    if t_u.save
      redirect_to tournament_path(:id => t_id)
    else
      @tournaments = Tournament.all
      render 'tournaments/index'
    end
  end

  # GET /show_games
  def show_games
    @games = Game.all
  end

  # POST /add_game
  def add_game
    t_g = TournamentGame.new(:game_id => params[:game][:game_id], :tournament_id => params[:id])
    if t_g.save
      redirect_to tournament_path
    else
      flash[:error] = 'game already exists for this tournament'
      @tournaments = Tournament.all
      render 'tournaments/index'
    end
  end

  private

  def list_games(tournament)
    t_g = TournamentGame.find_all_by_tournament_id(tournament.id)
    @games = @games.to_a
    t_g.each do |t|
      game = Game.find(t.game_id)
      @games.append(game)
    end
    @games
  end

  def list_players(tournament)
    t_u = TournamentUser.find_all_by_tournament_id(tournament.id)
    @players = @players.to_a
    t_u.each do |t|
      player = User.find(t.player_id)
      @players.append(player)
    end
    @players
  end

  def list_matches(tournament)
    @matches = Match.find_all_by_tournament_id(tournament.id)
  end

end
