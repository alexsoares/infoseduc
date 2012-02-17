require 'test_helper'

class TipoOsexternasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_osexternas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_osexterna" do
    assert_difference('TipoOsexterna.count') do
      post :create, :tipo_osexterna => { }
    end

    assert_redirected_to tipo_osexterna_path(assigns(:tipo_osexterna))
  end

  test "should show tipo_osexterna" do
    get :show, :id => tipo_osexternas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_osexternas(:one).to_param
    assert_response :success
  end

  test "should update tipo_osexterna" do
    put :update, :id => tipo_osexternas(:one).to_param, :tipo_osexterna => { }
    assert_redirected_to tipo_osexterna_path(assigns(:tipo_osexterna))
  end

  test "should destroy tipo_osexterna" do
    assert_difference('TipoOsexterna.count', -1) do
      delete :destroy, :id => tipo_osexternas(:one).to_param
    end

    assert_redirected_to tipo_osexternas_path
  end
end
