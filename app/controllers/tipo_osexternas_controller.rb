class TipoOsexternasController < ApplicationController
  # GET /tipo_osexternas
  # GET /tipo_osexternas.xml
  def index
    @tipo_osexterna = TipoOsexterna.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_osexterna }
    end
  end

  # GET /tipo_osexternas/1
  # GET /tipo_osexternas/1.xml
  def show
    @tipo_osexterna = TipoOsexterna.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_osexterna }
    end
  end

  # GET /tipo_osexternas/new
  # GET /tipo_osexternas/new.xml
  def new
    @tipo_osexterna = TipoOsexterna.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_osexterna }
    end
  end

  # GET /tipo_osexternas/1/edit
  def edit
    @tipo_osexterna = TipoOsexterna.find(params[:id])
  end

  # POST /tipo_osexternas
  # POST /tipo_osexternas.xml
  def create
    @tipo_osexterna = TipoOsexterna.new(params[:tipo_osexterna])

    respond_to do |format|
      if @tipo_osexterna.save
        flash[:notice] = 'CADASTRADO COM SUSCESSO.'
        format.html { redirect_to(new_tipo_osexterna_path) }
        format.xml  { render :xml => @tipo_osexterna, :status => :created, :location => @tipo_osexterna }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_osexterna.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_osexternas/1
  # PUT /tipo_osexternas/1.xml
  def update
    @tipo_osexterna = TipoOsexterna.find(params[:id])

    respond_to do |format|
      if @tipo_osexterna.update_attributes(params[:tipo_osexterna])
        flash[:notice] = 'ATUALIZADO COM SUCESSO.'
        format.html { redirect_to(@tipo_osexterna) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_osexterna.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_osexternas/1
  # DELETE /tipo_osexternas/1.xml
  def destroy
    @tipo_osexterna = TipoOsexterna.find(params[:id])
    @tipo_osexterna.destroy

    respond_to do |format|
      format.html { redirect_to(new_tipo_osexterna_path) }
      format.xml  { head :ok }
    end
  end

  def lista
    @tipo_osexterna = TipoOsexterna.find(:all)
    render :partial => 'lista_tipoos'

  end
end
