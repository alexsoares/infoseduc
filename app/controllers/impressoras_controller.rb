class ImpressorasController < ApplicationController
  # GET /impressoras
  # GET /impressoras.xml
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
    @impressoras = Impressora.find(:all)
   #   @impressoras = Impressora.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
   #   $var = 0
    else
      @impressoras = Impressora.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
   #   $var=1
   end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @impressoras }
    end
  end

  # GET /impressoras/1
  # GET /impressoras/1.xml
  def show
    @impressoras = Impressora.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @impressoras }
    end
  end

  # GET /impressoras/new
  # GET /impressoras/new.xml
  def new
    @impressoras = Impressora.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @impressoras }
    end
  end

  # GET /impressoras/1/edit
  def edit
    @impressoras = Impressora.find(params[:id])
  end

  # POST /impressoras
  # POST /impressoras.xml
  def create
    @impressoras = Impressora.new(params[:impressora])

    respond_to do |format|
      if @impressoras.save
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@impressoras) }
        format.xml  { render :xml => @impressoras, :status => :created, :location => @impressora }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @impressoras.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /impressoras/1
  # PUT /impressoras/1.xml
  def update
    @impressoras = Impressora.find(params[:id])

    respond_to do |format|
      if @impressoras.update_attributes(params[:impressora])
        flash[:notice] = 'SALVO COM SUCESSO'
        format.html { redirect_to(@impressoras) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @impressoras.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /impressoras/1
  # DELETE /impressoras/1.xml
  def destroy
    @impressoras = Impressora.find(params[:id])
    @impressoras.destroy

    respond_to do |format|
      format.html { redirect_to(impressoras_url) }
      format.xml  { head :ok }
    end
  end

 def consulta
    render  'consultas'
  end

def lista_unidades
    $unidade = params[:impressora_unidade_id]
    @impressoras = Impressora.find(:all, :conditions => ['unidade_id='+ $unidade])
    render :partial => 'lista_unidades'
  end

def consultatipo
    render 'consultastipo'
 end

def lista_tipos
    $tipo = params[:impressora_tipo_controle_id]
    @impressoras = Impressora.find(:all, :conditions => ['tipo_controle_id='+ $tipo])
    render :partial => 'lista_unidades'
  end
def consultatiponome
    render  'consultastiponome'
 end

def lista_tiponome
   $tipo = params[:impressora_tipo_controle_id]
   @unidade = Unidade.find :all, :conditions => {:tipo_id => params[:impressora_tipo_controle_id]}
     render :update do |page|
      page.replace_html 'esp_unidade', :partial => 'unidade_box'
  end
end

def lista_tipounidades
    $unidade = params[:impressora_unidade_id]
    @impressoras = Impressora.find(:all, :conditions => ['unidade_id=? and tipo_controle_id=?',$unidade, $tipo])
    render :partial => 'lista_unidades'
  end

def totalizaI
    @impressoras = Impressora.find(:all)
    respond_to do |format|
       format.html # index.html.erb
      format.xml  { render :xml => @impressoras }

    end
  end

end
