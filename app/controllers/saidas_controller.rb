class SaidasController < ApplicationController
  # GET /saidas
  # GET /saidas.xml

  before_filter :load_saidas
  before_filter :load_estoques
  before_filter :load_estagiarios
  before_filter :load_unidades
   before_filter :load_componentes

def load_componentes
    @componentes = Componente.find(:all, :order => 'nome ASC')
  end


def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end


def load_estagiarios
    @estagiarios = Estagiario.find(:all, :order => 'nome ASC')
  end

def load_saidas
    @saidas = Saida.find(:all)
  end


def load_estoques
    @estoques = Estoque.find(:all, :order => 'especifica ASC')
  end




  def index
    if (params[:search].nil? || params[:search].empty?)
     @saidas = Saida.paginate :page => params[:page], :order => 'data_saida DESC', :per_page => 10
      $var = 0
    else
      @saidas = Saida.find(:all, :joins=> :componente, :conditions => ["componentes.nome like ?", "%" + params[:search].to_s + "%"], :order => 'data_saida DESC')
        $var=1
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @saidas }
    end
  end

  # GET /saidas/1
  # GET /saidas/1.xml
  def show
    @saidas = Saida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @saidas }
    end
  end

  # GET /saidas/new
  # GET /saidas/new.xml
  def new
    @saidas = Saida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @saidas }
    end
  end

  # GET /saidas/1/edit
  def edit
    @saidas = Saida.find(params[:id])
  end

  # POST /saidas
  # POST /saidas.xml
  def create
    @saidas = Saida.new(params[:saida])

    respond_to do |format|
      if @saidas.save
        flash[:notice] = 'LANÇAMENTO SAIDA EFETUADO.'
        format.html { redirect_to(homes_path) }
        format.xml  { render :xml => @saidas, :status => :created, :location => @saidas }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @saidas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /saidas/1
  # PUT /saidas/1.xml
  def update
    @saidas = Saida.find(params[:id])

    respond_to do |format|
      if @saidas.update_attributes(params[:saida])
        flash[:notice] = 'LANÇAMENTO SAIDA ALTERADO.'
        format.html { redirect_to(homes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @saidas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /saidas/1
  # DELETE /saidas/1.xml
  def destroy
    @saidas = Saida.find(params[:id])
    @saidas.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end


  

   def nome_estagiario
   $estagiario = params[:saida_estagiario_id]
   @saidaestagiario = Estagiario.find(:all, :conditions => ['id =?',$estagiario])
   $nomeestagiario= Estagiario.find_by_id($estagiario).nome
        render :update do |page|
       page.replace_html 'estagiario_nome', :partial => 'exibe_estagiario'
    end
  end

    def nome_unidade
   $unidade = params[:saida_unidade_id]
   @saidaunidade = Unidade.find(:all, :conditions => ['id =?',$unidade])
   $nomeunidade= Unidade.find_by_id($unidade).nome
        render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
    end
  end

def lista_estoque
    $estoque = params[:saida_estoque_id]
    @estoques = Estoque.find(:all, :conditions => ['id=' + $estoque], :order => 'especifica ASC')
    render :partial => 'lista_estoque'
  end



   def nome_estoque
   $compo = params[:saida_componente_id]
  @estoques = Estoque.find :all, :conditions => {:componente_id => params[:saida_componente_id]}, :order => 'especifica ASC'
     render :update do |page|
      page.replace_html 'especificacao', :partial => 'especifica_box'
  end
end

def exibe_obs
  $estoque = params[:saida_estoque_id]
  @estoque = Estoque.find(:all,:conditions => ['id =?',$estoque])
  $estoque_obs= Estoque.find_by_id($estoque).obs
       render :update do |page|
         page.replace_html 'estoque_obs', :partial => 'exibe_obs'
      end
end


end
