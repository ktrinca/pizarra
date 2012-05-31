class Pizarra < ActiveRecord::Base

  MSJ_ERR_NOMBRE_VACIO  = "=> Debe introducir el nombre de la Pizarra."
  MSJ_ERR_NOMBRE_EXISTS = "=> La Pizarra Ya existe"


  validates_presence_of :nombre,
                        :message => MSJ_ERR_NOMBRE_VACIO

  validates_uniqueness_of :nombre,
                          :message => MSJ_ERR_NOMBRE_EXISTS

  has_many   :avisos
  belongs_to :user, :dependent => :destroy

 ##############################################################################
 # Obtiene tiene el array de pizarras que en sus aviso contienen el termino buscado
 #

  def self.find_aviso_contenido(query)
     avisos = Aviso.find(:all, :select=>['DISTINCT pizarra_id'],
                         :conditions => ["contenido like? and deleted_on is null " , "%#{query}%"])

     arr_pizarra_id = avisos.map{|a| a.pizarra_id}

     Pizarra.find(:all,:conditions=>["id in(?)",arr_pizarra_id])
  end


##############################################################################
 # Obtiene la fecha del ultimo aviso publicado hasta la fecha actual
 #

  def date_last_aviso
    avisos.publicados.last.created_at
  end

  def self.find_pizarra_until_current(pizarra_id,page)
    pizarras = Pizarra.find(:all, :conditions => ["id <>?", pizarra_id ])
    @pizarras = pizarras.paginate :page => page,:per_page => 3
  end

##############################################################################
 # Obtiene la clave y el valor de las listas de pizarras checkeadas dada el
 # array de variables de session.
 #

  def self.array_pizarras_check(hash_pizarras)
    return [] if hash_pizarras.nil?
    arr = hash_pizarras.map{|k,v| Pizarra.find(k) if v  }
    arr.compact
  end


end
