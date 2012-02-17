class RegiaosController < ApplicationController
  # GET /regiaos
  # GET /regiaos.xml
  def index
    @regiaos = Regiao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @regiaos }
    end
  end

  # GET /regiaos/1
  # GET /regiaos/1.xml
  def show
    @regiaos = Regiao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @regiaos }
    end
  end

  # GET /regiaos/new
  # GET /regiaos/new.xml
  def new
    @regiaos = Regiao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @regiaos }
    end
  end

  # GET /regiaos/1/edit
  def edit
    @regiaos = Regiao.find(params[:id])
  end

  # POST /regiaos
  # POST /regiaos.xml
  def create
    @regiaos = Regiao.new(params[:regiao])

    respond_to do |format|
      if @regiaos.save
        flash[:notice] = 'REGIÃO SALVA COM SUCESSO'
        format.html { redirect_to(new_regiao_path)}
        format.xml  { render :xml => @regiaos, :status => :created, :location => @regiaos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @regiaos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /regiaos/1
  # PUT /regiaos/1.xml
  def update
    @regiaos = Regiao.find(params[:id])

    respond_to do |format|
      if @regiaos.update_attributes(params[:regiao])
        flash[:notice] = 'REGIÃO SALVA COM SUCESSO'
        format.html { redirect_to(@regiaos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @regiaos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /regiaos/1
  # DELETE /regiaos/1.xml
  def destroy
    @regiaos = Regiao.find(params[:id])
    @regiaos.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end


  def lista
    @regiaos = Regiao.find(:all)
    render :partial => 'lista_regiao'

  end
end
