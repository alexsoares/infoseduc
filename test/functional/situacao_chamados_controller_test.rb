require 'test_helper'

class SituacaoChamadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:situacao_chamados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create situacao_chamados" do
    assert_difference('SituacaoChamados.count') do
      post :create, :situacao_chamados => { }
    end

    assert_redirected_to situacao_chamados_path(assigns(:situacao_chamados))
  end

  test "should show situacao_chamados" do
    get :show, :id => situacao_chamados(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => situacao_chamados(:one).id
    assert_response :success
  end

  test "should update situacao_chamados" do
    put :update, :id => situacao_chamados(:one).id, :situacao_chamados => { }
    assert_redirected_to situacao_chamados_path(assigns(:situacao_chamados))
  end

  test "should destroy situacao_chamados" do
    assert_difference('SituacaoChamados.count', -1) do
      delete :destroy, :id => situacao_chamados(:one).id
    end

    assert_redirected_to situacao_chamados_path
  end
end
