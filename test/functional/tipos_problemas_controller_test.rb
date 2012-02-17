require 'test_helper'

class TiposProblemasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_problemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_problemas" do
    assert_difference('TiposProblemas.count') do
      post :create, :tipos_problemas => { }
    end

    assert_redirected_to tipos_problemas_path(assigns(:tipos_problemas))
  end

  test "should show tipos_problemas" do
    get :show, :id => tipos_problemas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipos_problemas(:one).id
    assert_response :success
  end

  test "should update tipos_problemas" do
    put :update, :id => tipos_problemas(:one).id, :tipos_problemas => { }
    assert_redirected_to tipos_problemas_path(assigns(:tipos_problemas))
  end

  test "should destroy tipos_problemas" do
    assert_difference('TiposProblemas.count', -1) do
      delete :destroy, :id => tipos_problemas(:one).id
    end

    assert_redirected_to tipos_problemas_path
  end
end
