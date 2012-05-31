require 'test_helper'

class AvisoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_replace_tags_aviso_vacio
    aviso = Aviso.new(:contenido => '<p><br></p>')
    aviso.replace_tags!
    assert_equal '', aviso.contenido
  end
  
  def should_not_be_valid_with_contenido_empty
     aviso = Aviso.create(:contenido => '<p><br></p>')
     assert_equal(false, aviso.valid?)
  end
  
  def crear_pizarras
    Pizarra.destroy_all
    (1..10).map{|n| Pizarra.create(:nombre=>"test-#{n}", :user_id=>1)}
  end
  
  def test_create_aviso_pizarras_retorna_un_aviso
    aviso = Aviso.create_in_pizarras({:contenido=>"hola test"}, crear_pizarras)
    assert_kind_of(Aviso, aviso)
  end
  
  def test_create_aviso_pizarras_deberia_guardar_en_la_lista_de_pizarras
    pizarras = crear_pizarras
    aviso = Aviso.create_in_pizarras({:contenido=>"hola test"}, pizarras)
    pizarras.each{|p| assert(p.avisos.find_by_contenido("hola test"), 
      "la pizarra deberia contener el aviso hola test")
    }
  end
  
end
