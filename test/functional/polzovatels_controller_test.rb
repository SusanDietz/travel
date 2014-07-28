require 'test_helper'

class PolzovatelsControllerTest < ActionController::TestCase
  setup do
    @polzovatel = polzovatels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polzovatels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create polzovatel" do
    assert_difference('Polzovatel.count') do
      post :create, polzovatel: { nickname: @polzovatel.nickname, provider: @polzovatel.provider, url: @polzovatel.url, username: @polzovatel.username }
    end

    assert_redirected_to polzovatel_path(assigns(:polzovatel))
  end

  test "should show polzovatel" do
    get :show, id: @polzovatel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @polzovatel
    assert_response :success
  end

  test "should update polzovatel" do
    put :update, id: @polzovatel, polzovatel: { nickname: @polzovatel.nickname, provider: @polzovatel.provider, url: @polzovatel.url, username: @polzovatel.username }
    assert_redirected_to polzovatel_path(assigns(:polzovatel))
  end

  test "should destroy polzovatel" do
    assert_difference('Polzovatel.count', -1) do
      delete :destroy, id: @polzovatel
    end

    assert_redirected_to polzovatels_path
  end
end
