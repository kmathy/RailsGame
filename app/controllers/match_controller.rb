class MatchController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def edit
  end

  def update
  end
end
