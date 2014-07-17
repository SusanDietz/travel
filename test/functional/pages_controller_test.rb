require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get points" do
    get :points
    assert_response :success
  end

end
