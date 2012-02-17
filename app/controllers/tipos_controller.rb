class TiposController < ApplicationController
  # GET /tipos
  # GET /tipos.xml
  
  def index
    @tipos = Tipo.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos }
    end
  end

  # GET /tipos/1
  # GET /tipos/1.xml
  def show
    @tipos = Tipo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos }
    end
  end

  # GET /tipos/new
  # GET /tipos/new.xml
  def new
    @tipos = Tipo.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos }
    end
  end

  # GET /tipos/1/edit
  def edit
    @tipos = Tipo.find(params[:id])
  end

  # POST /tipos
  # POST /tipos.xml
  def create
    @tipos = Tipo.new(params[:tipo])
     respond_to do |format|
      if @tipos.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_tipo_path) }
        format.xml  { render :xml => @tipos, :status => :created, :location => @tipos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos.errors, :status => :unprocessable_entity }
      end
    end
 end

  # PUT /tipos/1
  # PUT /tipos/1.xml
  def update
    @tipos = Tipo.find(params[:id])

    respond_to do |format|
      if @tipos.update_attributes(params[:tipo])
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@tipos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos/1
  # DELETE /tipos/1.xml
  def destroy
    @tipos = Tipo.find(params[:id])
    @tipos.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

  def lista
    @tipos = Tipo.find(:all)
    render :partial => 'lista_tipo'

  end
end
