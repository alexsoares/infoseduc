require 'test_helper'

class UnidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidades" do
    assert_difference('Unidades.count') do
      post :create, :unidades => { }
    end

    assert_redirected_to unidades_path(assigns(:unidades))
  end

  test "should show unidades" do
    get :show, :id => unidades(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unidades(:one).id
    assert_response :success
  end

  test "should update unidades" do
    put :update, :id => unidades(:one).id, :unidades => { }
    assert_redirected_to unidades_path(assigns(:unidades))
  end

  test "should destroy unidades" do
    assert_difference('Unidades.count', -1) do
      delete :destroy, :id => unidades(:one).id
    end

    assert_redirected_to unidades_path
  end
end
