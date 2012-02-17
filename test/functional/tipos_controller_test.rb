require 'test_helper'

class TiposControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos" do
    assert_difference('Tipos.count') do
      post :create, :tipos => { }
    end

    assert_redirected_to tipos_path(assigns(:tipos))
  end

  test "should show tipos" do
    get :show, :id => tipos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipos(:one).id
    assert_response :success
  end

  test "should update tipos" do
    put :update, :id => tipos(:one).id, :tipos => { }
    assert_redirected_to tipos_path(assigns(:tipos))
  end

  test "should destroy tipos" do
    assert_difference('Tipos.count', -1) do
      delete :destroy, :id => tipos(:one).id
    end

    assert_redirected_to tipos_path
  end
end
