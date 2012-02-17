class InformativosController < ApplicationController
  # GET /informativos
  # GET /informativos.xml
  def index
    @informativos = Informativo.find(:all,:order => 'starts_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @informativos }
    end
  end

  # GET /informativos/1
  # GET /informativos/1.xml
  def show
    @informativo = Informativo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @informativo }
    end
  end

  # GET /informativos/new
  # GET /informativos/new.xml
  def new
    @informativo = Informativo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @informativo }
    end
  end

  # GET /informativos/1/edit
  def edit
    @informativo = Informativo.find(params[:id])
  end

  # POST /informativos
  # POST /informativos.xml
  def create
    @informativo = Informativo.new(params[:informativo])

    respond_to do |format|
      if @informativo.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@informativo) }
        format.xml  { render :xml => @informativo, :status => :created, :location => @informativo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @informativo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /informativos/1
  # PUT /informativos/1.xml
  def update
    @informativo = Informativo.find(params[:id])

    respond_to do |format|
      if @informativo.update_attributes(params[:informativo])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@informativo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @informativo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /informativos/1
  # DELETE /informativos/1.xml
  def destroy
    @informativo = Informativo.find(params[:id])
    @informativo.destroy

    respond_to do |format|
      format.html { redirect_to(informativos_url) }
      format.xml  { head :ok }
    end
  end
end
