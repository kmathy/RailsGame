class UserController < ApplicationController
  before_filter :user, :only => [:show, :favorites, :add_to_favorites]

  def favorites
    @favorites = @user.favorite_games
  end

  def add_to_favorites
    @game = Game.find(params[:id])
    @user.mark_as_favorite [@game]

    respond_to do |format|
      format.js
    end
  end

  private

  def user
    @user = current_user
  end
end
