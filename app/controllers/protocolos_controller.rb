class ProtocolosController < ApplicationController
  # GET /protocolos
  # GET /protocolos.xml
  def index
    @protocolos = Protocolo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @protocolos }
    end
  end

  # GET /protocolos/1
  # GET /protocolos/1.xml
  def show
    @protocolo = Protocolo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @protocolo }
    end
  end

  # GET /protocolos/new
  # GET /protocolos/new.xml
  def new
    @protocolo = Protocolo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @protocolo }
    end
  end

  # GET /protocolos/1/edit
  def edit
    @protocolo = Protocolo.find(params[:id])
  end

  # POST /protocolos
  # POST /protocolos.xml
  def create
    @protocolo = Protocolo.new(params[:protocolo])

    respond_to do |format|
      if @protocolo.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@protocolo) }
        format.xml  { render :xml => @protocolo, :status => :created, :location => @protocolo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @protocolo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /protocolos/1
  # PUT /protocolos/1.xml
  def update
    @protocolo = Protocolo.find(params[:id])

    respond_to do |format|
      if @protocolo.update_attributes(params[:protocolo])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@protocolo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @protocolo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /protocolos/1
  # DELETE /protocolos/1.xml
  def destroy
    @protocolo = Protocolo.find(params[:id])
    @protocolo.destroy

    respond_to do |format|
      format.html { redirect_to(protocolos_url) }
      format.xml  { head :ok }
    end
  end
end
