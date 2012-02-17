require 'test_helper'

class SaidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saidas" do
    assert_difference('Saidas.count') do
      post :create, :saidas => { }
    end

    assert_redirected_to saidas_path(assigns(:saidas))
  end

  test "should show saidas" do
    get :show, :id => saidas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => saidas(:one).id
    assert_response :success
  end

  test "should update saidas" do
    put :update, :id => saidas(:one).id, :saidas => { }
    assert_redirected_to saidas_path(assigns(:saidas))
  end

  test "should destroy saidas" do
    assert_difference('Saidas.count', -1) do
      delete :destroy, :id => saidas(:one).id
    end

    assert_redirected_to saidas_path
  end
end
