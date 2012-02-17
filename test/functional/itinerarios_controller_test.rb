require 'test_helper'

class ItinerariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerario" do
    assert_difference('Itinerario.count') do
      post :create, :itinerario => { }
    end

    assert_redirected_to itinerario_path(assigns(:itinerario))
  end

  test "should show itinerario" do
    get :show, :id => itinerarios(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => itinerarios(:one).id
    assert_response :success
  end

  test "should update itinerario" do
    put :update, :id => itinerarios(:one).id, :itinerario => { }
    assert_redirected_to itinerario_path(assigns(:itinerario))
  end

  test "should destroy itinerario" do
    assert_difference('Itinerario.count', -1) do
      delete :destroy, :id => itinerarios(:one).id
    end

    assert_redirected_to itinerarios_path
  end
end
