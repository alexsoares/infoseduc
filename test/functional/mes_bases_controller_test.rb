require 'test_helper'

class MesBasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mes_bases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mes_base" do
    assert_difference('MesBase.count') do
      post :create, :mes_base => { }
    end

    assert_redirected_to mes_base_path(assigns(:mes_base))
  end

  test "should show mes_base" do
    get :show, :id => mes_bases(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mes_bases(:one).to_param
    assert_response :success
  end

  test "should update mes_base" do
    put :update, :id => mes_bases(:one).to_param, :mes_base => { }
    assert_redirected_to mes_base_path(assigns(:mes_base))
  end

  test "should destroy mes_base" do
    assert_difference('MesBase.count', -1) do
      delete :destroy, :id => mes_bases(:one).to_param
    end

    assert_redirected_to mes_bases_path
  end
end
