require 'test_helper'

class RelatoriosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relatorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relatorios" do
    assert_difference('Relatorios.count') do
      post :create, :relatorios => { }
    end

    assert_redirected_to relatorios_path(assigns(:relatorios))
  end

  test "should show relatorios" do
    get :show, :id => relatorios(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relatorios(:one).id
    assert_response :success
  end

  test "should update relatorios" do
    put :update, :id => relatorios(:one).id, :relatorios => { }
    assert_redirected_to relatorios_path(assigns(:relatorios))
  end

  test "should destroy relatorios" do
    assert_difference('Relatorios.count', -1) do
      delete :destroy, :id => relatorios(:one).id
    end

    assert_redirected_to relatorios_path
  end
end
