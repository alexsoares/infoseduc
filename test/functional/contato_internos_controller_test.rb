require 'test_helper'

class ContatoInternosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contato_internos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contato_interno" do
    assert_difference('ContatoInterno.count') do
      post :create, :contato_interno => { }
    end

    assert_redirected_to contato_interno_path(assigns(:contato_interno))
  end

  test "should show contato_interno" do
    get :show, :id => contato_internos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contato_internos(:one).to_param
    assert_response :success
  end

  test "should update contato_interno" do
    put :update, :id => contato_internos(:one).to_param, :contato_interno => { }
    assert_redirected_to contato_interno_path(assigns(:contato_interno))
  end

  test "should destroy contato_interno" do
    assert_difference('ContatoInterno.count', -1) do
      delete :destroy, :id => contato_internos(:one).to_param
    end

    assert_redirected_to contato_internos_path
  end
end
