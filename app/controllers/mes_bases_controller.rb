class MesBasesController < ApplicationController
  # GET /mes_bases
  # GET /mes_bases.xml
  def index
    @mes_bases = MesBase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mes_bases }
    end
  end

  # GET /mes_bases/1
  # GET /mes_bases/1.xml
  def show
    @mes_base = MesBase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mes_base }
    end
  end

  # GET /mes_bases/new
  # GET /mes_bases/new.xml
  def new
    @mes_base = MesBase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mes_base }
    end
  end

  # GET /mes_bases/1/edit
  def edit
    @mes_base = MesBase.find(params[:id])
  end

  # POST /mes_bases
  # POST /mes_bases.xml
  def create
    @mes_base = MesBase.new(params[:mes_base])
    @mes_base.mes = @mes_base.data.strftime("%m").to_i
    respond_to do |format|
      if @mes_base.save
        flash[:notice] = 'CADASTRADO COM SUCESSO'
        format.html { redirect_to(@mes_base) }
        format.xml  { render :xml => @mes_base, :status => :created, :location => @mes_base }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mes_base.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mes_bases/1
  # PUT /mes_bases/1.xml
  def update
    @mes_base = MesBase.find(params[:id])

    respond_to do |format|
      if @mes_base.update_attributes(params[:mes_base])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@mes_base) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mes_base.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mes_bases/1
  # DELETE /mes_bases/1.xml
  def destroy
    @mes_base = MesBase.find(params[:id])
    @mes_base.destroy

    respond_to do |format|
      format.html { redirect_to(mes_bases_url) }
      format.xml  { head :ok }
    end
  end
end
