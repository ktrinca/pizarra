class PizarrasController < ApplicationController
  # GET /pizarras
  # GET /pizarras.xml
  
##############################################################################
 # Control para que no muestre el layout en los html de hel y helpGeneral  
 #
 layout "application", :except=> [:help, :helpGeneral] 

##############################################################################
 # Forma array de acciones en donde debe requerir el login  
 # 
  before_filter :login_required,
               :only => [:create, :destroy, :new, :edit]

##############################################################################
 # Accion de help general e invoca al partial del helpGeneral   
 #  
 def helpGeneral
 
   render :patial=>"helpGeneral"
 
 end

##############################################################################
 # Accion de help general e invoca al partial del help instructivo solo en show 
 # de pizarra   
 #
 def help
   
   render :patial=>"_help"
 end


##############################################################################
 # Accion show para visualizar la pizarra con los avisos dado una fecha  
 #
  
 def show_avisos_publicados_fecha
   fecha = params[:fecha].to_date
   @pizarra = Pizarra.find(params[:id])
   @avisos = @pizarra.avisos.find_publicados_a_la_fecha(fecha)
   render(:update) { |page| page.replace_html 'contentNote', 
                     :partial =>"pizarraHistorial",
                     :locals     => {:fecha => fecha} } 
                     
 end 

##############################################################################
 # Accion que se invoca por url_remote para guardar en la variable de session los
 # checkbox seleccionados de la lista de pizarras  
 #
   
 def save_selected
   session[:pizarras] ||= Hash.new
   id_chk = params[:id_chk]
   chk_estado = (params[:estado] == "false") ? false : true
   session[:pizarras][id_chk] = chk_estado
   render :nothing => true 
 end   
 
 
##############################################################################
 #Accion para buscar en avisos de la pizarra 
 #
 
 def search
    query = params[:q]
    pizarras  = Pizarra.find_aviso_contenido(query)
    @pizarras = pizarras.paginate :page => params[:page],:per_page => 2
  end

##############################################################################
 #Elimina aviso de pizarra dado el id del aviso
 #
   
  def trash_aviso
    aviso = Aviso.find(params[:idNote])
    aviso.logic_destroy
    render :update do |page|
      render(:update) { |page| page.reload }

    end
  end

##############################################################################
 #Lista todas las pizarras
 #
 
  def index
     @pizarras = Pizarra.paginate :page => params[:page],:per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pizarras }
    end
  end

  # GET /pizarras/1
  # GET /pizarras/1.xml

##############################################################################
 #Mustrar los avisos en la pizarra
 #
   
  def show
    @pizarra = Pizarra.find(params[:id])
    @avisos = @pizarra.avisos
    @aviso   = Aviso.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pizarra }
    end
  end

end
