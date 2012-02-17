require 'test_helper'

class ImpressorasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impressoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create impressora" do
    assert_difference('Impressora.count') do
      post :create, :impressora => { }
    end

    assert_redirected_to impressora_path(assigns(:impressora))
  end

  test "should show impressora" do
    get :show, :id => impressoras(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => impressoras(:one).to_param
    assert_response :success
  end

  test "should update impressora" do
    put :update, :id => impressoras(:one).to_param, :impressora => { }
    assert_redirected_to impressora_path(assigns(:impressora))
  end

  test "should destroy impressora" do
    assert_difference('Impressora.count', -1) do
      delete :destroy, :id => impressoras(:one).to_param
    end

    assert_redirected_to impressoras_path
  end
end
