class DatashowsController < ApplicationController
 layout "application"
  # GET /datashows
  # GET /datashows.xml
  before_filter :load_unidades
  before_filter :load_tipocontroles


   def load_tipocontroles
    @tipo_controles = TipoControle.find(:all)
  end

   def load_unidades
     @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  def index
     if (params[:search].nil? || params[:search].empty?)
     @datashows = Datashow.find(:all)
      # @datashows = Datashow.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
     # $var = 0
    else
      @datashows = Datashow.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      #$var=1
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datashows }
    end
  end

  # GET /datashows/1
  # GET /datashows/1.xml
  def show
    @datashows = Datashow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datashows }
    end
  end

  # GET /datashows/new
  # GET /datashows/new.xml
  def new

    @datashows = Datashow.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datashows }
    end
  end

  # GET /datashows/1/edit
  def edit
    @datashows = Datashow.find(params[:id])
  end

  # POST /datashows
  # POST /datashows.xml
  def create
    @datashows = Datashow.new(params[:datashow])

    respond_to do |format|
      if @datashows.save
        flash[:notice] = 'RESERVA REALIZADA COM SUCESSO'
        format.html { redirect_to(@datashows) }
        format.xml  { render :xml => @datashows, :status => :created, :location => @datashow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datashows.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datashows/1
  # PUT /datashows/1.xml
  def update
    @datashows = Datashow.find(params[:id])

    respond_to do |format|
      if @datashows.update_attributes(params[:datashow])
        flash[:notice] = 'RESERVA ALTERADA COM SUCESSO'
        format.html { redirect_to(@datashows) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datashows.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datashows/1
  # DELETE /datashows/1.xml
  def destroy
    @datashows = Datashow.find(params[:id])
    @datashows.destroy

    respond_to do |format|
      format.html { redirect_to(datashows_url) }
      format.xml  { head :ok }
    end
  end

def consulta
    render 'consultas'
  end

def lista_unidades
    $unidade = params[:datashow_unidade_id]
    @datashows = Datashow.find(:all, :conditions => ['unidade_id='+ $unidade])
    render :partial => 'lista_unidades'
  end

def consultatipo
    render :partial => 'consultastipo'
 end

def lista_tipos
    $tipo = params[:datashow_tipo_controle_id]
     @datashows = Datashow.find(:all, :conditions => ['tipo_controle_id='+ $tipo])
    render :partial => 'lista_unidades'
  end


def consultatiponome
    render :partial => 'consultastiponome'
 end

def lista_tiponome
   $tipo = params[:datashow_tipo_controle_id]
   @unidade = Unidade.find :all, :conditions => {:tipo_id => params[:datashow_tipo_controle_id]}
     render :update do |page|
      page.replace_html 'esp_unidade', :partial => 'unidade_box'
  end
end

def lista_tipounidades
    $unidade = params[:datashow_unidade_id]
    @datashows = Datashow.find(:all, :conditions => ['unidade_id=? and tipo_controle_id=?',$unidade, $tipo])
    render :partial => 'lista_unidades'
  end

def totalizaS
    @datashows = Datashow.find(:all)
     respond_to do |format|
       format.html # index.html.erb
      format.xml  { render :xml => @datashows }

    end
  end

end
