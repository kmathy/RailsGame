require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matches" do
    assert_difference('Match.count') do
      post :create, matches: {points: @match.points, score: @match.score }
    end

    assert_redirected_to match_path(assigns(:matches))
  end

  test "should show matches" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update matches" do
    put :update, id: @match, matches: {points: @match.points, score: @match.score }
    assert_redirected_to match_path(assigns(:matches))
  end

  test "should destroy matches" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
