class TiposProblemasController < ApplicationController
  # GET /tipos_problemas
  # GET /tipos_problemas.xml
  def index
    @tipos_problemas = TiposProblema.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_problemas }
    end
  end

  # GET /tipos_problemas/1
  # GET /tipos_problemas/1.xml
  def show
    @tipos_problemas = TiposProblema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos_problemas }
    end
  end

  # GET /tipos_problemas/new
  # GET /tipos_problemas/new.xml
  def new
    @tipos_problemas = TiposProblema.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos_problemas }
    end
  end

  # GET /tipos_problemas/1/edit
  def edit
    @tipos_problemas = TiposProblemas.find(params[:id])
  end

  # POST /tipos_problemas
  # POST /tipos_problemas.xml
  def create
    @tipos_problemas = TiposProblema.new(params[:tipos_problema])

    respond_to do |format|
      if @tipos_problemas.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_tipos_problema_path) }
        format.xml  { render :xml => @tipos_problemas, :status => :created, :location => @tipos_problemas }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos_problemas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_problemas/1
  # PUT /tipos_problemas/1.xml
  def update
    @tipos_problemas = TiposProblema.find(params[:id])

    respond_to do |format|
      if @tipos_problemas.update_attributes(params[:tipos_problema])
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@tipos_problemas) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos_problemas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_problemas/1
  # DELETE /tipos_problemas/1.xml
  def destroy
    @tipos_problemas = TiposProblema.find(params[:id])
    @tipos_problemas.destroy

    respond_to do |format|
      format.html { redirect_to(new_tipos_problema_path) }
      format.xml  { head :ok }
    end
  end
  def lista
    @tipos_problemas = TiposProblema.find(:all)
    render :partial => 'lista_tipopro'

  end
end
