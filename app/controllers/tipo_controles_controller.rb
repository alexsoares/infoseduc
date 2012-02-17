class TipoControlesController < ApplicationController
  # GET /tipo_controles
  # GET /tipo_controles.xml
  def index
    @tipo_controles = TipoControle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_controles }
    end
  end

  # GET /tipo_controles/1
  # GET /tipo_controles/1.xml
  def show
    @tipo_controles = TipoControle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_controles }
    end
  end

  # GET /tipo_controles/new
  # GET /tipo_controles/new.xml
  def new
    @tipo_controles = TipoControle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_controles }
    end
  end

  # GET /tipo_controles/1/edit
  def edit
    @tipo_controles = TipoControle.find(params[:id])
  end

  # POST /tipo_controles
  # POST /tipo_controles.xml
  def create
    @tipo_controles = TipoControle.new(params[:tipo_controle])

    respond_to do |format|
      if @tipo_controles.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@tipo_controles) }
        format.xml  { render :xml => @tipo_controles, :status => :created, :location => @tipo_controle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_controles.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_controles/1
  # PUT /tipo_controles/1.xml
  def update
    @tipo_controles = TipoControle.find(params[:id])

    respond_to do |format|
      if @tipo_controles.update_attributes(params[:tipo_controle])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@tipo_controles) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_controles.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_controles/1
  # DELETE /tipo_controles/1.xml
  def destroy
    @tipo_controles = TipoControle.find(params[:id])
    @tipo_controles.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_controles_url) }
      format.xml  { head :ok }
    end
  end
end
