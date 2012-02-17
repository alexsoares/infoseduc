require 'test_helper'

class RelatestagiariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relatestagiarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relatestagiario" do
    assert_difference('Relatestagiario.count') do
      post :create, :relatestagiario => { }
    end

    assert_redirected_to relatestagiario_path(assigns(:relatestagiario))
  end

  test "should show relatestagiario" do
    get :show, :id => relatestagiarios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relatestagiarios(:one).to_param
    assert_response :success
  end

  test "should update relatestagiario" do
    put :update, :id => relatestagiarios(:one).to_param, :relatestagiario => { }
    assert_redirected_to relatestagiario_path(assigns(:relatestagiario))
  end

  test "should destroy relatestagiario" do
    assert_difference('Relatestagiario.count', -1) do
      delete :destroy, :id => relatestagiarios(:one).to_param
    end

    assert_redirected_to relatestagiarios_path
  end
end
