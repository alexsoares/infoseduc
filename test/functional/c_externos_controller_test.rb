require 'test_helper'

class CExternosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_externos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_externo" do
    assert_difference('CExterno.count') do
      post :create, :c_externo => { }
    end

    assert_redirected_to c_externo_path(assigns(:c_externo))
  end

  test "should show c_externo" do
    get :show, :id => c_externos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => c_externos(:one).to_param
    assert_response :success
  end

  test "should update c_externo" do
    put :update, :id => c_externos(:one).to_param, :c_externo => { }
    assert_redirected_to c_externo_path(assigns(:c_externo))
  end

  test "should destroy c_externo" do
    assert_difference('CExterno.count', -1) do
      delete :destroy, :id => c_externos(:one).to_param
    end

    assert_redirected_to c_externos_path
  end
end
