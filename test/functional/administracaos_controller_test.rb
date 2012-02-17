require 'test_helper'

class AdministracaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracaos" do
    assert_difference('Administracaos.count') do
      post :create, :administracaos => { }
    end

    assert_redirected_to administracaos_path(assigns(:administracaos))
  end

  test "should show administracaos" do
    get :show, :id => administracaos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => administracaos(:one).id
    assert_response :success
  end

  test "should update administracaos" do
    put :update, :id => administracaos(:one).id, :administracaos => { }
    assert_redirected_to administracaos_path(assigns(:administracaos))
  end

  test "should destroy administracaos" do
    assert_difference('Administracaos.count', -1) do
      delete :destroy, :id => administracaos(:one).id
    end

    assert_redirected_to administracaos_path
  end
end
