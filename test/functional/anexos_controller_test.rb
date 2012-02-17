require 'test_helper'

class AnexosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anexos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anexo" do
    assert_difference('Anexo.count') do
      post :create, :anexo => { }
    end

    assert_redirected_to anexo_path(assigns(:anexo))
  end

  test "should show anexo" do
    get :show, :id => anexos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => anexos(:one).to_param
    assert_response :success
  end

  test "should update anexo" do
    put :update, :id => anexos(:one).to_param, :anexo => { }
    assert_redirected_to anexo_path(assigns(:anexo))
  end

  test "should destroy anexo" do
    assert_difference('Anexo.count', -1) do
      delete :destroy, :id => anexos(:one).to_param
    end

    assert_redirected_to anexos_path
  end
end
