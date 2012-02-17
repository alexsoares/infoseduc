require 'test_helper'

class EmfaltasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emfaltas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emfalta" do
    assert_difference('Emfalta.count') do
      post :create, :emfalta => { }
    end

    assert_redirected_to emfalta_path(assigns(:emfalta))
  end

  test "should show emfalta" do
    get :show, :id => emfaltas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => emfaltas(:one).to_param
    assert_response :success
  end

  test "should update emfalta" do
    put :update, :id => emfaltas(:one).to_param, :emfalta => { }
    assert_redirected_to emfalta_path(assigns(:emfalta))
  end

  test "should destroy emfalta" do
    assert_difference('Emfalta.count', -1) do
      delete :destroy, :id => emfaltas(:one).to_param
    end

    assert_redirected_to emfaltas_path
  end
end
