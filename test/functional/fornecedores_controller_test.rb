require 'test_helper'

class FornecedoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fornecedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fornecedores" do
    assert_difference('Fornecedores.count') do
      post :create, :fornecedores => { }
    end

    assert_redirected_to fornecedores_path(assigns(:fornecedores))
  end

  test "should show fornecedores" do
    get :show, :id => fornecedores(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fornecedores(:one).id
    assert_response :success
  end

  test "should update fornecedores" do
    put :update, :id => fornecedores(:one).id, :fornecedores => { }
    assert_redirected_to fornecedores_path(assigns(:fornecedores))
  end

  test "should destroy fornecedores" do
    assert_difference('Fornecedores.count', -1) do
      delete :destroy, :id => fornecedores(:one).id
    end

    assert_redirected_to fornecedores_path
  end
end
