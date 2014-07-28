require 'test_helper'

class Polzovatel::OmniauthCallbacksControllerTest < ActionController::TestCase
  test "should get facebook" do
    get :facebook
    assert_response :success
  end

  test "should get vkontakte" do
    get :vkontakte
    assert_response :success
  end

end
