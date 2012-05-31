class AvisosController < ApplicationController
  # GET /avisos
  # GET /avisos.xml

  before_filter :load_pizarra

##############################################################################
 # Vista listado de avisos
  def index
    @avisos = @pizarra.avisos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @avisos }
    end
  end

  # GET /avisos/1
  # GET /avisos/1.xml
  def show
    @aviso = @pizarra.avisos.find(params[:id])

     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aviso }
    end
  end

  # GET /avisos/new
  # GET /avisos/new.xml
  def new

    @aviso = @pizarra.avisos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aviso }
    end
  end

  # GET /avisos/1/edit
  def edit
    @aviso = @pizarra.avisos.find(params[:id])
  end

  # POST /avisos
  # POST /avisos.xml

 ##############################################################################
 # Crea aviso en la pizarra e invoca al render de pizarras guardadas
 # en el caso que se haya guardado

  def create
    array_pizarras  = [ Pizarra.find(params[:pizarra_id]) ]
    array_pizarras += Pizarra.array_pizarras_check(session[:pizarras])


    @aviso = Aviso.create_in_pizarras({ :contenido => params[:contenido],
                                        :created_at => params[:fecha_ini],
                                        :deleted_on => params[:fecha_ven] },
                                        array_pizarras )

    render(:update){|page|
      page.replace_html 'contentNote', :partial =>"pizarras/pizarrasave"
    }
    session[:pizarras] = nil
  end

  # PUT /avisos/1
  # PUT /avisos/1.xml
  def update
    @aviso = @pizarra.avisos.find(params[:id])

    respond_to do |format|
      if @aviso.update_attributes(params[:aviso])
        flash[:notice] = 'Aviso was successfully updated.'
        format.html { redirect_to(@pizarra) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aviso.errors, :status => :unprocessable_entity }
      end
    end
  end

##############################################################################
 # Obtiene el id de pizarra a traves del parametro id de la url
 #

  def load_pizarra
    @pizarra = Pizarra.find(params[:pizarra_id])
  end

end
