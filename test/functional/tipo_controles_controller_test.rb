require 'test_helper'

class TipoControlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_controles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_controle" do
    assert_difference('TipoControle.count') do
      post :create, :tipo_controle => { }
    end

    assert_redirected_to tipo_controle_path(assigns(:tipo_controle))
  end

  test "should show tipo_controle" do
    get :show, :id => tipo_controles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_controles(:one).to_param
    assert_response :success
  end

  test "should update tipo_controle" do
    put :update, :id => tipo_controles(:one).to_param, :tipo_controle => { }
    assert_redirected_to tipo_controle_path(assigns(:tipo_controle))
  end

  test "should destroy tipo_controle" do
    assert_difference('TipoControle.count', -1) do
      delete :destroy, :id => tipo_controles(:one).to_param
    end

    assert_redirected_to tipo_controles_path
  end
end
