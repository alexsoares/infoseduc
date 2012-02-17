class EstoquesController < ApplicationController
  # GET /estoques
  # GET /estoques.xml
    layout "application"

   
   before_filter :load_estoques
   before_filter :load_componentes

def load_componentes
    @componentes = Componente.find(:all, :order => 'nome ASC')
end

def load_estoques
    @estoques = Estoque.find(:all,:order => 'especifica ASC')
  end

   
  def index
    if (params[:search].nil? || params[:search].empty?)
     @estoques = Estoque.find(:all, :joins => :componente, :order => 'componentes.nome ASC')
     var = 0
      $var1 = 0
    else
      #@estoques = Estoque.find(:all,:order => 'especifica ASC')
      @estoques = Estoque.find(:all, :joins => :componente, :conditions => ["componentes.nome like ?", "%" + params[:search].to_s + "%"], :order => 'especifica DESC')
      #@administracaos = Administracao.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var=1
      $var1=1
    end
    #@estoques = Estoque.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estoques }
    end
  end

  # GET /estoques/1
  # GET /estoques/1.xml
  def show
    @estoques = Estoque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estoques }
    end
  end

  # GET /estoques/new
  # GET /estoques/new.xml
  def new
    @estoques = Estoque.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estoques }
    end
  end

  # GET /estoques/1/edit
  def edit
    @estoques = Estoque.find(params[:id])
  end

  # POST /estoques
  # POST /estoques.xml
  def create
    @estoques = Estoque.new(params[:estoque])

    respond_to do |format|
      if @estoques.save
        flash[:notice] = 'ESTOQUE CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@estoques) }
        format.xml  { render :xml => @estoques, :status => :created, :location => @estoques }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estoques.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estoques/1
  # PUT /estoques/1.xml
  def update
    @estoques = Estoque.find(params[:id])

    respond_to do |format|
      if @estoques.update_attributes(params[:estoque])
        flash[:notice] = 'ESTOQUE SALVO COM SUCESSO.'
        format.html { redirect_to(@estoques) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estoques.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estoques/1
  # DELETE /estoques/1.xml
  def destroy
     @estoque = Estoque.find(params[:id])
    $estoque_id = params[:id]
    @estrada = Entrada.find(:all, :conditions => ['estoque_id = ' + $estoque_id])
    @saida = Saida.find(:all, :conditions => ['estoque_id = ' + $estoque_id])
    for entrada in @estrada
      entrada.destroy
    end
    for saida in @saida
       saida.destroy
    end

    @estoque.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

   def nome_unidade
   $unidade = params[:estoque_unidade_id]
   @estoqueunidade = Unidade.find(:all, :include => 'estoques', :conditions => ['id =?',$unidade])
   $nomeunidade= Unidade.find_by_id($unidade).nome
     render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
    end
  end

   def nome_estagiario
   $estagiario = params[:estoque_estagiario_id]
   @estoqueestagiario = Estagiario.find(:all, :include => 'estoques', :conditions => ['id =?',$estagiario])
   $nomeestagiario= Estagiario.find_by_id($estagiario).nome
     render :update do |page|
       page.replace_html 'estagiario_nome', :partial => 'exibe_estagiario'
    end
  end


 def consulta
    render :partial => 'consultas'
  end

def lista_estoque
    $estoque = params[:estoque_estoque_id]
    @estoques = Estoque.find(:all, :conditions => ['id=' + $estoque])
    render :partial => 'lista_estoque'
  end
end
