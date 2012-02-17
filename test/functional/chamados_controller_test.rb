require 'test_helper'

class ChamadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chamados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chamados" do
    assert_difference('Chamados.count') do
      post :create, :chamados => { }
    end

    assert_redirected_to chamados_path(assigns(:chamados))
  end

  test "should show chamados" do
    get :show, :id => chamados(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chamados(:one).id
    assert_response :success
  end

  test "should update chamados" do
    put :update, :id => chamados(:one).id, :chamados => { }
    assert_redirected_to chamados_path(assigns(:chamados))
  end

  test "should destroy chamados" do
    assert_difference('Chamados.count', -1) do
      delete :destroy, :id => chamados(:one).id
    end

    assert_redirected_to chamados_path
  end
end
