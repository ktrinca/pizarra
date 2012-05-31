require 'test_helper'

class PizarrasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pizarras)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_pizarra
    assert_difference('Pizarra.count') do
      post :create, :pizarra => { }
    end

    assert_redirected_to pizarra_path(assigns(:pizarra))
  end

  def test_should_show_pizarra
    get :show, :id => pizarras(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pizarras(:one).id
    assert_response :success
  end

  def test_should_update_pizarra
    put :update, :id => pizarras(:one).id, :pizarra => { }
    assert_redirected_to pizarra_path(assigns(:pizarra))
  end

  def test_should_destroy_pizarra
    assert_difference('Pizarra.count', -1) do
      delete :destroy, :id => pizarras(:one).id
    end

    assert_redirected_to pizarras_path
  end
end
