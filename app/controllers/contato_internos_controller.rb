class ContatoInternosController < ApplicationController
  # GET /contato_internos
  # GET /contato_internos.xml
  def index
    @contato_internos = ContatoInterno.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contato_internos }
    end
  end

  # GET /contato_internos/1
  # GET /contato_internos/1.xml
  def show
    @contato_interno = ContatoInterno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contato_interno }
    end
  end

  # GET /contato_internos/new
  # GET /contato_internos/new.xml
  def new
    @contato_interno = ContatoInterno.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contato_interno }
    end
  end

  # GET /contato_internos/1/edit
  def edit
    @contato_interno = ContatoInterno.find(params[:id])
  end

  # POST /contato_internos
  # POST /contato_internos.xml
  def create
    @contato_interno = ContatoInterno.new(params[:contato_interno])

    respond_to do |format|
      if @contato_interno.save
        flash[:notice] = 'ContatoInterno was successfully created.'
        format.html { redirect_to(@contato_interno) }
        format.xml  { render :xml => @contato_interno, :status => :created, :location => @contato_interno }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contato_interno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contato_internos/1
  # PUT /contato_internos/1.xml
  def update
    @contato_interno = ContatoInterno.find(params[:id])

    respond_to do |format|
      if @contato_interno.update_attributes(params[:contato_interno])
        flash[:notice] = 'ContatoInterno was successfully updated.'
        format.html { redirect_to(@contato_interno) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contato_interno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contato_internos/1
  # DELETE /contato_internos/1.xml
  def destroy
    @contato_interno = ContatoInterno.find(params[:id])
    @contato_interno.destroy

    respond_to do |format|
      format.html { redirect_to(contato_internos_url) }
      format.xml  { head :ok }
    end
  end
end
