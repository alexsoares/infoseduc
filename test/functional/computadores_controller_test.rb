require 'test_helper'

class ComputadoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:computadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create computadore" do
    assert_difference('Computadore.count') do
      post :create, :computadore => { }
    end

    assert_redirected_to computadore_path(assigns(:computadore))
  end

  test "should show computadore" do
    get :show, :id => computadores(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => computadores(:one).to_param
    assert_response :success
  end

  test "should update computadore" do
    put :update, :id => computadores(:one).to_param, :computadore => { }
    assert_redirected_to computadore_path(assigns(:computadore))
  end

  test "should destroy computadore" do
    assert_difference('Computadore.count', -1) do
      delete :destroy, :id => computadores(:one).to_param
    end

    assert_redirected_to computadores_path
  end
end
