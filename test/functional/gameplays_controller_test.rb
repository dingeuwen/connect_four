require 'test_helper'

class GameplaysControllerTest < ActionController::TestCase
  setup do
    @gameplay = gameplays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameplays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameplay" do
    assert_difference('Gameplay.count') do
      post :create, gameplay: { game_id: @gameplay.game_id, user1_id: @gameplay.user1_id, user2_id: @gameplay.user2_id }
    end

    assert_redirected_to gameplay_path(assigns(:gameplay))
  end

  test "should show gameplay" do
    get :show, id: @gameplay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameplay
    assert_response :success
  end

  test "should update gameplay" do
    put :update, id: @gameplay, gameplay: { game_id: @gameplay.game_id, user1_id: @gameplay.user1_id, user2_id: @gameplay.user2_id }
    assert_redirected_to gameplay_path(assigns(:gameplay))
  end

  test "should destroy gameplay" do
    assert_difference('Gameplay.count', -1) do
      delete :destroy, id: @gameplay
    end

    assert_redirected_to gameplays_path
  end
end
