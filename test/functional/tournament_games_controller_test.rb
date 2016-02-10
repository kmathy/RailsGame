require 'test_helper'

class TournamentGamesControllerTest < ActionController::TestCase
  setup do
    @tournament_game = tournament_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_game" do
    assert_difference('TournamentGame.count') do
      post :create, tournament_game: { game_id: @tournament_game.game_id, tournament_id: @tournament_game.tournament_id }
    end

    assert_redirected_to tournament_game_path(assigns(:tournament_game))
  end

  test "should show tournament_game" do
    get :show, id: @tournament_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_game
    assert_response :success
  end

  test "should update tournament_game" do
    put :update, id: @tournament_game, tournament_game: { game_id: @tournament_game.game_id, tournament_id: @tournament_game.tournament_id }
    assert_redirected_to tournament_game_path(assigns(:tournament_game))
  end

  test "should destroy tournament_game" do
    assert_difference('TournamentGame.count', -1) do
      delete :destroy, id: @tournament_game
    end

    assert_redirected_to tournament_games_path
  end
end
