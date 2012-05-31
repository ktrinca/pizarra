class Aviso < ActiveRecord::Base
 belongs_to :pizarra

 validates_presence_of(:contenido, :message => "Debe introducir el contenido.")

 PUBLICADO_QUERY =  "( deleted_on is null or deleted_on > ? ) and ( date(created_at) <= ? )"

 named_scope :publicados, :conditions => [PUBLICADO_QUERY,  DateTime.now.to_date, DateTime.now.to_date ]

 before_validation :replace_tags!

 ##############################################################################
 # Reemplaza en el campo contenido los caracteres especiales reemplazados
 # por javascript.
 #

 def replace_tags!
   self.contenido.gsub!("<p><br></p>","")
   self.contenido.gsub!("\n","<br>")
   self.contenido.gsub!("\r","")
   self.contenido.gsub!("|q;q","&")
   self.contenido.gsub!("|q;cq","?")
 end

 ##############################################################################
 # Arma el id del div de notas con el id de la clase y el id del aviso
 #

 def css_id
   "#{self.class}-#{self.id}"
 end

##############################################################################
 # Asigna valor de dia actual al campo date_deleted_on para borrado logico y si
 # si el campo date_deleted_on es igual a la fecha actual lo elimina fisicamente
 #

 def logic_destroy
  date_deleted_on = DateTime.now.to_date
  if created_at.to_date == date_deleted_on
    destroy
  else
    self.deleted_on = date_deleted_on.to_formatted_s(:db)
    self.save!
  end

 end


##############################################################################
 # Arma el rando de periodo de publicacion de aviso con los campos deleted_on.nil
 # y el campo deleted_on.nil
 #
 def periodo_de_vida
   top_date =  deleted_on.nil? ? DateTime.now.to_date.succ : deleted_on
   created_at.to_date..top_date
 end

##############################################################################
 # Obtiene el array de avisos publicados hasta la fecha dada para armado de historico
 #

 def self.find_publicados_a_la_fecha(fecha)
   (find(:all).map{|a| a if a.periodo_de_vida.include? fecha}).compact
 end


##############################################################################
 # Obtiene el array de avisos publicados hasta la fecha dada para armado de historico
 #
 def self.list_avisos(query)
  avisos = Aviso.publicados.find(:all, :select=>['id'],
           :conditions => ["contenido like? " , "%#{query}%"])
  arr_avisos = avisos.map{|a| a.id}
  Aviso.find(:all,:conditions=>["id in(?)",arr_avisos])
 end

##############################################################################
 # Agrega notas en la pizarra dado el hash_aviso(parametros) y el array de id
 # de pizarras
 #

def self.create_in_pizarras(hash_aviso, pizarras)
  aviso = nil
  pizarras.each{|p|
    aviso = Aviso.new(hash_aviso)
    p.avisos << aviso
  }
  aviso
end

end
