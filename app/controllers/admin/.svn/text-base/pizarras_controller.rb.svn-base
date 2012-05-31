class Admin::PizarrasController < ApplicationController
  # GET /pizarras
  # GET /pizarras.xml
  
  before_filter :login_required,
               :only => [:create, :destroy, :new, :edit, :index]
  
  
 ##############################################################################
 # Accion que obtiene el listado de pizarras para listarlas en render pizarras

  def index
    @pizarras = current_user.pizarras.paginate :page => params[:page],:per_page => 5 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pizarras }
    end
  end

 ##############################################################################
 # Crea instancia para nueva pizarra

  # GET /pizarras/new
  # GET /pizarras/new.xml
  def new
    @pizarra = Pizarra.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pizarra }
    end
  end

##############################################################################
 # Edita nombre de pizarra

  # GET /pizarras/1/edit
  def edit
    @pizarra = Pizarra.find(params[:id])
  end

  # POST /pizarras
  # POST /pizarras.xml

##############################################################################
 # Crea una pizarra

  def create
    @pizarra = Pizarra.new(params[:pizarra])
    @pizarra.user = current_user
    respond_to do |format|
      if @pizarra.save
        flash[:notice] = 'Pizarra ha sido creada.'
        format.html { redirect_to(admin_pizarras_path) }
        format.xml  { render :xml => @pizarra, :status => :created, :location => @pizarra }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pizarra.errors, :status => :unprocessable_entity }
      end
    end
  end

##############################################################################
 # Actualiza nombre de la pizarra y llama a vista edit

  # PUT /pizarras/1
  # PUT /pizarras/1.xml
  def update
    @pizarra = Pizarra.find(params[:id])

    respond_to do |format|
      if @pizarra.update_attributes(params[:pizarra])
        flash[:notice] = 'El nombre de la pizarra se ha actualizado.'
        format.html { redirect_to(admin_pizarras_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pizarra.errors, :status => :unprocessable_entity }
      end
    end
  end

##############################################################################
 # Borra pizarra
  
  # DELETE /pizarras/1
  # DELETE /pizarras/1.xml
  def destroy
    @pizarra = Pizarra.find(params[:id])
    @pizarra.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pizarras_url) }
      format.xml  { head :ok }
    end
  end

  
end
