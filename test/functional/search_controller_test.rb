require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get list_games" do
    get :list_games
    assert_response :success
  end

  test "should get list_tournaments" do
    get :list_tournaments
    assert_response :success
  end

  test "should get list_users" do
    get :list_users
    assert_response :success
  end

end
