require 'test_helper'

class SenhasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:senhas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create senhas" do
    assert_difference('Senhas.count') do
      post :create, :senhas => { }
    end

    assert_redirected_to senhas_path(assigns(:senhas))
  end

  test "should show senhas" do
    get :show, :id => senhas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => senhas(:one).id
    assert_response :success
  end

  test "should update senhas" do
    put :update, :id => senhas(:one).id, :senhas => { }
    assert_redirected_to senhas_path(assigns(:senhas))
  end

  test "should destroy senhas" do
    assert_difference('Senhas.count', -1) do
      delete :destroy, :id => senhas(:one).id
    end

    assert_redirected_to senhas_path
  end
end
