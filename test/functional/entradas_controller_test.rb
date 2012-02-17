require 'test_helper'

class EntradasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entradas" do
    assert_difference('Entradas.count') do
      post :create, :entradas => { }
    end

    assert_redirected_to entradas_path(assigns(:entradas))
  end

  test "should show entradas" do
    get :show, :id => entradas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => entradas(:one).id
    assert_response :success
  end

  test "should update entradas" do
    put :update, :id => entradas(:one).id, :entradas => { }
    assert_redirected_to entradas_path(assigns(:entradas))
  end

  test "should destroy entradas" do
    assert_difference('Entradas.count', -1) do
      delete :destroy, :id => entradas(:one).id
    end

    assert_redirected_to entradas_path
  end
end
