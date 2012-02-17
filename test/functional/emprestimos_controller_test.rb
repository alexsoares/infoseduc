require 'test_helper'

class EmprestimosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emprestimos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emprestimo" do
    assert_difference('Emprestimo.count') do
      post :create, :emprestimo => { }
    end

    assert_redirected_to emprestimo_path(assigns(:emprestimo))
  end

  test "should show emprestimo" do
    get :show, :id => emprestimos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => emprestimos(:one).to_param
    assert_response :success
  end

  test "should update emprestimo" do
    put :update, :id => emprestimos(:one).to_param, :emprestimo => { }
    assert_redirected_to emprestimo_path(assigns(:emprestimo))
  end

  test "should destroy emprestimo" do
    assert_difference('Emprestimo.count', -1) do
      delete :destroy, :id => emprestimos(:one).to_param
    end

    assert_redirected_to emprestimos_path
  end
end
