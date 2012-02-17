class EntradasController < ApplicationController
  # GET /entradas
  # GET /entradas.xml

  before_filter :load_entradas
  before_filter :load_estoques
  before_filter :load_componentes

def load_componentes
    @componentes = Componente.find(:all, :order => 'nome ASC')
  end

def load_entradas
    @entradas = Entrada.find(:all,:order => 'data_ent DESC')
  end


def load_estoques
    @estoques = Estoque.find(:all, :order => 'especifica ASC')
  end
  
  def index
    if (params[:search].nil? || params[:search].empty?)
     @entradas = Entrada.paginate :page => params[:page], :order => 'data_ent DESC', :per_page => 10
      $var = 0
    else
      @entradas = Entrada.find(:all, :joins=> :componente, :conditions => ["componentes.nome like ?", "%" + params[:search].to_s + "%"], :order => 'data_ent DESC')
        $var=1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entradas }
    end
  end

  # GET /entradas/1
  # GET /entradas/1.xml
  def show
    @entradas = Entrada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entradas }
    end
  end

  # GET /entradas/new
  # GET /entradas/new.xml
  def new
    @entradas = Entrada.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entradas }
    end
  end

  # GET /entradas/1/edit
  def edit
    @entradas = Entrada.find(params[:id])
  end

  # POST /entradas
  # POST /entradas.xml
  def create
    @entradas = Entrada.new(params[:entrada])

    respond_to do |format|
      if @entradas.save
        flash[:notice] = 'LANÇAMENTO ENTRADA EFETUADO'
        format.html { redirect_to(homes_path) }
        format.xml  { render :xml => @entradas, :status => :created, :location => @entradas }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entradas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entradas/1
  # PUT /entradas/1.xml
  def update
    @entradas = Entrada.find(params[:id])

    respond_to do |format|
      if @entradas.update_attributes(params[:entrada])
        flash[:notice] = 'LANÇAMENTO ENTRADA ALTERADO.'
        format.html { redirect_to(@entradas) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entradas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entradas/1
  # DELETE /entradas/1.xml
  def destroy
    @entradas = Entrada.find(params[:id])
    @entradas.destroy

    respond_to do |format|
      format.html{ redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end
def consulta
    render :partial => 'consultas'
  end

def lista_estoque
    $estoque = params[:estoque_estoque_id]
    @estoques = Estoque.find(:all, :conditions => ['id=' + $estoque], :order => 'especifica ASC')
    render :partial => 'lista_estoque'
  end

 def nome_estoque
   $compo = params[:entrada_componente_id]
   @estoques = Estoque.find :all, :conditions => {:componente_id => params[:entrada_componente_id]}, :order => 'especifica ASC'
     render :update do |page|
      page.replace_html 'especificacao', :partial => 'especifica_box'
  end
end

def exibe_obs
  $estoque = params[:entrada_estoque_id]
  @estoque = Estoque.find(:all,:conditions => ['id =?',$estoque])
  $estoque_obs= Estoque.find_by_id($estoque).obs
       render :update do |page|
         page.replace_html 'estoque_obs', :partial => 'exibe_obs'
      end
end
end


