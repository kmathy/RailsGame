module API
  class TournamentController < ApplicationController
    def index
      tournaments = Tournament.all
      render json: tournaments, status: :ok
    end
  end
end