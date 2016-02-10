class TournamentGamesController < ApplicationController
  # GET /tournament_games
  # GET /tournament_games.json
  def index
    @tournament_games = TournamentGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_games }
    end
  end

  # GET /tournament_games/1
  # GET /tournament_games/1.json
  def show
    @tournament_game = TournamentGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_game }
    end
  end

  # GET /tournament_games/new
  # GET /tournament_games/new.json
  def new
    @tournament_game = TournamentGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament_game }
    end
  end

  # GET /tournament_games/1/edit
  def edit
    @tournament_game = TournamentGame.find(params[:id])
  end

  # POST /tournament_games
  # POST /tournament_games.json
  def create
    @tournament_game = TournamentGame.new(params[:tournament_game])

    respond_to do |format|
      if @tournament_game.save
        format.html { redirect_to @tournament_game, notice: 'Tournament game was successfully created.' }
        format.json { render json: @tournament_game, status: :created, location: @tournament_game }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_games/1
  # PUT /tournament_games/1.json
  def update
    @tournament_game = TournamentGame.find(params[:id])

    respond_to do |format|
      if @tournament_game.update_attributes(params[:tournament_game])
        format.html { redirect_to @tournament_game, notice: 'Tournament game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_games/1
  # DELETE /tournament_games/1.json
  def destroy
    @tournament_game = TournamentGame.find(params[:id])
    @tournament_game.destroy

    respond_to do |format|
      format.html { redirect_to tournament_games_url }
      format.json { head :no_content }
    end
  end
end
