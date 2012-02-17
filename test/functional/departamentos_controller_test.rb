require 'test_helper'

class DepartamentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create departamentos" do
    assert_difference('Departamentos.count') do
      post :create, :departamentos => { }
    end

    assert_redirected_to departamentos_path(assigns(:departamentos))
  end

  test "should show departamentos" do
    get :show, :id => departamentos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => departamentos(:one).id
    assert_response :success
  end

  test "should update departamentos" do
    put :update, :id => departamentos(:one).id, :departamentos => { }
    assert_redirected_to departamentos_path(assigns(:departamentos))
  end

  test "should destroy departamentos" do
    assert_difference('Departamentos.count', -1) do
      delete :destroy, :id => departamentos(:one).id
    end

    assert_redirected_to departamentos_path
  end
end
