require 'test_helper'

class ProtocolosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protocolos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protocolo" do
    assert_difference('Protocolo.count') do
      post :create, :protocolo => { }
    end

    assert_redirected_to protocolo_path(assigns(:protocolo))
  end

  test "should show protocolo" do
    get :show, :id => protocolos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => protocolos(:one).to_param
    assert_response :success
  end

  test "should update protocolo" do
    put :update, :id => protocolos(:one).to_param, :protocolo => { }
    assert_redirected_to protocolo_path(assigns(:protocolo))
  end

  test "should destroy protocolo" do
    assert_difference('Protocolo.count', -1) do
      delete :destroy, :id => protocolos(:one).to_param
    end

    assert_redirected_to protocolos_path
  end
end
