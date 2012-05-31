module PizarrasHelper

 ##############################################################################
 # Muestra la fecha de creacion del ultimo aviso si tiene avisos
 #
 def date_last_aviso(pizarra)


   if pizarra.avisos.publicados.last.nil?
      "<h3>No tiene Avisos</h3>"
    else
    date_aviso = pizarra.date_last_aviso.to_date
      "<h3>Fecha de &uacute;ltimo aviso</h3>" +
          date_aviso.to_formatted_s()
   end

 end

 ##############################################################################
 # seta string de la propiedad confirm del link limpiar pizarra
 #

 def text_confirm_clear_avisos(pizarra)

  if pizarra.avisos.empty?
     text_confirm = "No hay avisos para eliminar"
  else
     text_confirm = "Esta seguro que desea borrar todos los avisos?"
  end

  link_to image_tag("/images/limpiarPizarra4.gif",
   :title=> "Borrar Avisos de Pizarra"),
   admin_trash_avisos_path(pizarra),
   :confirm => text_confirm

 end

 ##############################################################################
 # imprime cabecera de tabla index de home
 #
 def text_header_index
   if Pizarra.find(:all).empty?
      "<h3>No hay Pizarras Guardadas!</h3>"
   else
      "<b>Nombre - Pizarra</b>"
   end

 end

 ##############################################################################
 # imprime cabecera de tabla index de home
 #
 def text_header_search (pizarras)
   if pizarras.empty?
      "<h3>No se encontraron resultados</h3>"
   else
      "<h3>Resultado de la b&uacute;squeda:</h3>"
   end

 end

 ##############################################################################
 # imprime checkbox_tag
 #
 def checkbox_tag_pizarra (pizarra)

    if session[:pizarras].nil? or session[:pizarras]["#{pizarra.id}"].nil?
      estado = false
    else
       estado = session[:pizarras]["#{pizarra.id}"]
    end

    "<tr><td>" +
     check_box_tag(pizarra.id,pizarra.id, estado, {:value => "0",
     :onclick => remote_function(:url => {:action => 'save_selected'},
     :with => "'id_chk='+ this.id +'&estado='+ estado_checked(this.id)" )}) +

    "</td><td><b>" + pizarra.nombre + "</b></td></tr>"

 end

end
