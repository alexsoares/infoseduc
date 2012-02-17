require 'test_helper'

class EstoquesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estoques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estoques" do
    assert_difference('Estoques.count') do
      post :create, :estoques => { }
    end

    assert_redirected_to estoques_path(assigns(:estoques))
  end

  test "should show estoques" do
    get :show, :id => estoques(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estoques(:one).id
    assert_response :success
  end

  test "should update estoques" do
    put :update, :id => estoques(:one).id, :estoques => { }
    assert_redirected_to estoques_path(assigns(:estoques))
  end

  test "should destroy estoques" do
    assert_difference('Estoques.count', -1) do
      delete :destroy, :id => estoques(:one).id
    end

    assert_redirected_to estoques_path
  end
end
