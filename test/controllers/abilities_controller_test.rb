require 'test_helper'

class AbilitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get get_ability" do
    get :get_ability
    assert_response :success
  end

end
