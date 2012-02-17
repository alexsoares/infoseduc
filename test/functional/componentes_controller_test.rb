require 'test_helper'

class ComponentesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componentes" do
    assert_difference('Componentes.count') do
      post :create, :componentes => { }
    end

    assert_redirected_to componentes_path(assigns(:componentes))
  end

  test "should show componentes" do
    get :show, :id => componentes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => componentes(:one).id
    assert_response :success
  end

  test "should update componentes" do
    put :update, :id => componentes(:one).id, :componentes => { }
    assert_redirected_to componentes_path(assigns(:componentes))
  end

  test "should destroy componentes" do
    assert_difference('Componentes.count', -1) do
      delete :destroy, :id => componentes(:one).id
    end

    assert_redirected_to componentes_path
  end
end
