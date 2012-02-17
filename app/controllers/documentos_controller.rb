class DocumentosController < ApplicationController
  before_filter :load_load
  # GET /documentos
  # GET /documentos.xml
  def index
    @documentos = @externo.documentos.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documentos }
    end
  end

  # GET /documentos/1
  # GET /documentos/1.xml
  def show
    @documento = @externo.documentos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/new
  # GET /documentos/new.xml
  def new
    @documento = @externo.documentos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/1/edit
  def edit
    @documento = @externo.documentos.find(params[:id])
  end

  # POST /documentos
  # POST /documentos.xml
  def create
    @documento = @externo.documentos.build(params[:documento])

    respond_to do |format|
      if @documento.save
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to [@externo,@documento] }
        format.xml  { render :xml => @documento, :status => :created, :location => @documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documentos/1
  # PUT /documentos/1.xml
  def update
    @documento = @externo.documentos.find(params[:id])

    respond_to do |format|
      if @documento.update_attributes(params[:documento])
        flash[:notice] = 'ATUALIZADO COM SUCESSO.'
        format.html { redirect_to[@externo,@documento] }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.xml
  def destroy
    @documento = @externo.documentos.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to(documentos_url(@externo)) }
      format.xml  { head :ok }
    end
  end

  protected

  def load_load
    @externo = CExterno.find(params[:c_externo_id], :include=>:documentos)
    @c = CExterno.all
  end
end
