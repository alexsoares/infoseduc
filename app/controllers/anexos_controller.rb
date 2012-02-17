class AnexosController < ApplicationController
  # GET /anexos
  # GET /anexos.xml
  before_filter :load_resources
  def index
    if params[:unidade].present?
      @anexos = Anexo.all(:conditions => ["unidade_id = ?", params[:unidade]])
    else
      @anexos = Anexo.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @anexos }
    end
  end

  # GET /anexos/1
  # GET /anexos/1.xml
  def show
    @anexo = Anexo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @anexo }
    end
  end

  # GET /anexos/new
  # GET /anexos/new.xml
  def new
    @anexo = Anexo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anexo }
    end
  end

  # GET /anexos/1/edit
  def edit
    @anexo = Anexo.find(params[:id])
  end

  # POST /anexos
  # POST /anexos.xml
  def create
    @anexo = Anexo.new(params[:anexo])

    respond_to do |format|
      if @anexo.save
        flash[:notice] = 'Anexo was successfully created.'
        format.html { redirect_to(@anexo) }
        format.xml  { render :xml => @anexo, :status => :created, :location => @anexo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anexo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anexos/1
  # PUT /anexos/1.xml
  def update
    @anexo = Anexo.find(params[:id])

    respond_to do |format|
      if @anexo.update_attributes(params[:anexo])
        flash[:notice] = 'Anexo was successfully updated.'
        format.html { redirect_to(@anexo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anexo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anexos/1
  # DELETE /anexos/1.xml
  def destroy
    @anexo = Anexo.find(params[:id])
    @anexo.destroy

    respond_to do |format|
      format.html { redirect_to(anexos_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def load_resources
    verifica_unidade    
  end
  def verifica_unidade
    unless params[:unidade].present?
      @unidades = Unidade.all
    
    end
  end
end
