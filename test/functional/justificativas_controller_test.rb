require 'test_helper'

class JustificativasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:justificativas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create justificativa" do
    assert_difference('Justificativa.count') do
      post :create, :justificativa => { }
    end

    assert_redirected_to justificativa_path(assigns(:justificativa))
  end

  test "should show justificativa" do
    get :show, :id => justificativas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => justificativas(:one).to_param
    assert_response :success
  end

  test "should update justificativa" do
    put :update, :id => justificativas(:one).to_param, :justificativa => { }
    assert_redirected_to justificativa_path(assigns(:justificativa))
  end

  test "should destroy justificativa" do
    assert_difference('Justificativa.count', -1) do
      delete :destroy, :id => justificativas(:one).to_param
    end

    assert_redirected_to justificativas_path
  end
end
