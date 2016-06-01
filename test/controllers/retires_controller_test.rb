require 'test_helper'

class RetiresControllerTest < ActionController::TestCase
  setup do
    @retire = retires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retire" do
    assert_difference('Retire.count') do
      post :create, retire: { telephone: @retire.telephone, user_id: @retire.user_id }
    end

    assert_redirected_to retire_path(assigns(:retire))
  end

  test "should show retire" do
    get :show, id: @retire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retire
    assert_response :success
  end

  test "should update retire" do
    patch :update, id: @retire, retire: { telephone: @retire.telephone, user_id: @retire.user_id }
    assert_redirected_to retire_path(assigns(:retire))
  end

  test "should destroy retire" do
    assert_difference('Retire.count', -1) do
      delete :destroy, id: @retire
    end

    assert_redirected_to retires_path
  end
end
