class TournamentUsersController < ApplicationController
  # GET /tournament_users
  # GET /tournament_users.json
  def index
    @tournament_users = TournamentUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_users }
    end
  end

  # GET /tournament_users/1
  # GET /tournament_users/1.json
  def show
    @tournament_user = TournamentUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_user }
    end
  end

  # GET /tournament_users/new
  # GET /tournament_users/new.json
  def new
    @tournament_user = TournamentUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament_user }
    end
  end

  # GET /tournament_users/1/edit
  def edit
    @tournament_user = TournamentUser.find(params[:id])
  end

  # POST /tournament_users
  # POST /tournament_users.json
  def create
    @tournament_user = TournamentUser.new(params[:tournament_user])

    respond_to do |format|
      if @tournament_user.save
        format.html { redirect_to @tournament_user, notice: 'Tournament user was successfully created.' }
        format.json { render json: @tournament_user, status: :created, location: @tournament_user }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_users/1
  # PUT /tournament_users/1.json
  def update
    @tournament_user = TournamentUser.find(params[:id])

    respond_to do |format|
      if @tournament_user.update_attributes(params[:tournament_user])
        format.html { redirect_to @tournament_user, notice: 'Tournament user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_users/1
  # DELETE /tournament_users/1.json
  def destroy
    @tournament_user = TournamentUser.find(params[:id])
    @tournament_user.destroy

    respond_to do |format|
      format.html { redirect_to tournament_users_url }
      format.json { head :no_content }
    end
  end
end
