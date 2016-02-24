class TournamentsController < ApplicationController

  before_filter :authenticate_user!

  # GET /tournaments
  # GET /tournaments.json
  def index
    @q = Tournament.ransack(params[:q])
    @q.sorts = 'name ASC' if @q.sorts.empty?
    @tournaments = Kaminari.paginate_array(@q.result(distinct: true)).page(params[:page])
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @tournaments }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @tournament = Tournament.find(params[:id])
    @pending_players = PendingPlayer.find_all_by_tournament_id(@tournament.id)
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
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end

  # POST /add_player
  def add_player
    tournament = Tournament.find(params[:tournament][:tournament_id])
    game = tournament.games.find(params[:tournament][:game_id])
    user = User.find(session['warden.user.user.key'][0][0])

    user.games.push(game) unless user.games.include?(game)
    game.users.push(user) unless game.users.include?(user)
    tournament.users.push(user) unless tournament.users.include?(user)

    PendingPlayer.create(:tournament_id => tournament.id, :game_id => game.id, :player_id => user.id)

    redirect_to tournament_path(:id => tournament.id)
  end

  # GET /show_games
  def show_games
    games = Tournament.find(params[:id]).games
    @games = Game.all.reject { |game_tournament| games.any? { |game| game_tournament['title'].include?(game.title) } }
  end

  # POST /add_game
  def add_game
    game = Game.find(params[:game][:game_id])
    Tournament.find(params[:id]).games.push(game)
    redirect_to tournament_path
  end

  def seed
    for i in 0..20
      Tournament.create(:name => "Tournament n°#{i}", :nb_players_max => 5, :place => "Bruxelles Avenue Louise #{i}")
    end
    redirect_to tournaments_path
  end

  def seed_players
    players = User.all
    tournament = Tournament.find(params[:id])
    players.each do |player|
      tournament.users.push(player)
    end
    redirect_to tournament_path(params[:id])
  end
end
