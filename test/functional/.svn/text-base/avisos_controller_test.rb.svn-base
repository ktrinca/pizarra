require 'test_helper'

class AvisosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:avisos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_aviso
    assert_difference('Aviso.count') do
      post :create, :aviso => { }
    end

    assert_redirected_to aviso_path(assigns(:aviso))
  end

  def test_should_show_aviso
    get :show, :id => avisos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => avisos(:one).id
    assert_response :success
  end

  def test_should_update_aviso
    put :update, :id => avisos(:one).id, :aviso => { }
    assert_redirected_to aviso_path(assigns(:aviso))
  end

  def test_should_destroy_aviso
    assert_difference('Aviso.count', -1) do
      delete :destroy, :id => avisos(:one).id
    end

    assert_redirected_to avisos_path
  end
end
