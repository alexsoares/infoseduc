require 'test_helper'

class EstagiariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estagiarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estagiarios" do
    assert_difference('Estagiarios.count') do
      post :create, :estagiarios => { }
    end

    assert_redirected_to estagiarios_path(assigns(:estagiarios))
  end

  test "should show estagiarios" do
    get :show, :id => estagiarios(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estagiarios(:one).id
    assert_response :success
  end

  test "should update estagiarios" do
    put :update, :id => estagiarios(:one).id, :estagiarios => { }
    assert_redirected_to estagiarios_path(assigns(:estagiarios))
  end

  test "should destroy estagiarios" do
    assert_difference('Estagiarios.count', -1) do
      delete :destroy, :id => estagiarios(:one).id
    end

    assert_redirected_to estagiarios_path
  end
end
