require 'test_helper'

class DatashowsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datashows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datashow" do
    assert_difference('Datashow.count') do
      post :create, :datashow => { }
    end

    assert_redirected_to datashow_path(assigns(:datashow))
  end

  test "should show datashow" do
    get :show, :id => datashows(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => datashows(:one).to_param
    assert_response :success
  end

  test "should update datashow" do
    put :update, :id => datashows(:one).to_param, :datashow => { }
    assert_redirected_to datashow_path(assigns(:datashow))
  end

  test "should destroy datashow" do
    assert_difference('Datashow.count', -1) do
      delete :destroy, :id => datashows(:one).to_param
    end

    assert_redirected_to datashows_path
  end
end
