require 'test_helper'

class InformativosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:informativos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create informativo" do
    assert_difference('Informativo.count') do
      post :create, :informativo => { }
    end

    assert_redirected_to informativo_path(assigns(:informativo))
  end

  test "should show informativo" do
    get :show, :id => informativos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => informativos(:one).to_param
    assert_response :success
  end

  test "should update informativo" do
    put :update, :id => informativos(:one).to_param, :informativo => { }
    assert_redirected_to informativo_path(assigns(:informativo))
  end

  test "should destroy informativo" do
    assert_difference('Informativo.count', -1) do
      delete :destroy, :id => informativos(:one).to_param
    end

    assert_redirected_to informativos_path
  end
end
