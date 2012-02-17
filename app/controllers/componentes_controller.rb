class ComponentesController < ApplicationController
  # GET /componentes
  # GET /componentes.xml
  def index
    @componentes = Componente.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @componentes }
    end
  end

  # GET /componentes/1
  # GET /componentes/1.xml
  def show
    @componentes = Componente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @componentes }
    end
  end

  # GET /componentes/new
  # GET /componentes/new.xml
  def new
    @componentes = Componente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @componentes }
    end
  end

  # GET /componentes/1/edit
  def edit
    @componentes = Componente.find(params[:id])
  end

  # POST /componentes
  # POST /componentes.xml
  def create
    @componentes = Componente.new(params[:componente])

    respond_to do |format|
      if @componentes.save
        flash[:notice] = 'COMPONENTE CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_componente_path) }
        format.xml  { render :xml => @componentes, :status => :created, :location => @componentes }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @componentes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /componentes/1
  # PUT /componentes/1.xml
  def update
    @componentes = Componente.find(params[:id])

    respond_to do |format|
      if @componentes.update_attributes(params[:componente])
        flash[:notice] = 'COMPONENTE SALVOO COM SUCESSO..'
        format.html { redirect_to(@componentes) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @componentes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /componentes/1
  # DELETE /componentes/1.xml
  def destroy
    @componentes = Componente.find(params[:id])
    @componentes.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def lista
    @componentes = Componente.find(:all)
    render :partial => 'lista_componente'

  end

end
