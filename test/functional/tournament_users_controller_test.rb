require 'test_helper'

class TournamentUsersControllerTest < ActionController::TestCase
  setup do
    @tournament_user = tournament_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_user" do
    assert_difference('TournamentUser.count') do
      post :create, tournament_user: {  }
    end

    assert_redirected_to tournament_user_path(assigns(:tournament_user))
  end

  test "should show tournament_user" do
    get :show, id: @tournament_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_user
    assert_response :success
  end

  test "should update tournament_user" do
    put :update, id: @tournament_user, tournament_user: {  }
    assert_redirected_to tournament_user_path(assigns(:tournament_user))
  end

  test "should destroy tournament_user" do
    assert_difference('TournamentUser.count', -1) do
      delete :destroy, id: @tournament_user
    end

    assert_redirected_to tournament_users_path
  end
end
