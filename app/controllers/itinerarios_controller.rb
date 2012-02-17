class ItinerariosController < ApplicationController
  # GET /itinerarios
  # GET /itinerarios.xml

   before_filter :load_estagiarios
  before_filter :load_unidades


def load_unidades

  @unidades = Unidade.find(:all, :order => "nome ASC")

  end


def load_estagiarios

    @estagiarios = Estagiario.find(:all, :conditions =>  ["etinerante= 1 and desligado=0"], :order => 'nome ASC')
  end


  def index
   @date = params[:month] ? Date.parse(params[:month]) : Date.today
   @search = Itinerario.search(params[:search])
   if (params[:search].blank?)
     
   else
      @itinerante = @search.all
      
   end

  end

  # GET /itinerarios/1
  # GET /itinerarios/1.xml
  def show
    @itinerario = Itinerario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itinerario }
    end
  end

  # GET /itinerarios/new
  # GET /itinerarios/new.xml
  def new
    @itinerario = Itinerario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @itinerario }
    end
  end

  # GET /itinerarios/1/edit
  def edit
    @itinerario = Itinerario.find(params[:id])
  end

  # POST /itinerarios
  # POST /itinerarios.xml
  def create
    @itinerario = Itinerario.new(params[:itinerario])

    respond_to do |format|
      if @itinerario.save
        flash[:notice] = 'ITINERÁRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@itinerario) }
        format.xml  { render :xml => @itinerario, :status => :created, :location => @itinerario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @itinerario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itinerarios/1
  # PUT /itinerarios/1.xml
  def update
    @itinerario = Itinerario.find(params[:id])

    respond_to do |format|
      if @itinerario.update_attributes(params[:itinerario])
        flash[:notice] = 'ITINERÁRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@itinerario) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itinerario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerarios/1
  # DELETE /itinerarios/1.xml
  def destroy
    @itinerario = Itinerario.find(params[:id])
    @itinerario.destroy

    respond_to do |format|
      format.html { redirect_to(itinerarios_url) }
      format.xml  { head :ok }
    end
  end
end
