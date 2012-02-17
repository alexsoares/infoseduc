class ComputadoresController < ApplicationController
  # GET /computadores
  # GET /computadores.xml
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
      #@computadores = Computadore.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
      @computadores = Computadore.find(:all)
      #$var = 0
    else
      @computadores = Computadore.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      #$var=1
    end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @computadores }
    end
  end

  # GET /computadores/1
  # GET /computadores/1.xml
  def show
    @computadores = Computadore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @computadores }
    end
  end

  # GET /computadores/new
  # GET /computadores/new.xml
  def new
    @computadores = Computadore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @computadores }
    end
  end

  # GET /computadores/1/edit
  def edit
    @computadores = Computadore.find(params[:id])
  end

  # POST /computadores
  # POST /computadores.xml
  def create
    @computadores = Computadore.new(params[:computadore])

    respond_to do |format|
      if @computadores.save
        flash[:notice] = 'COMPUTADOR CADASTRADO'
        format.html { redirect_to(@computadores) }
        format.xml  { render :xml => @computadores, :status => :created, :location => @computadores }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @computadores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /computadores/1
  # PUT /computadores/1.xml
  def update
    @computadores = Computadore.find(params[:id])

    respond_to do |format|
      if @computadores.update_attributes(params[:computadore])
        flash[:notice] = 'COMPUTADOR ATUALIZADO'
        format.html { redirect_to(@computadores) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @computadores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /computadores/1
  # DELETE /computadores/1.xml
  def destroy
    @computadores = Computadore.find(params[:id])
    @computadores.destroy

    respond_to do |format|
      format.html { redirect_to(computadores_url) }
      format.xml  { head :ok }
    end
  end

    def nome_unidade
   $unidade = params[:computadore_unidade_id]
   @computadorunidade = Unidade.find(:all, :conditions => ['id =?',$unidade])
   $nomeunidade= Unidade.find_by_id($unidade).nome
     render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
    end
  end

def consulta
    render 'consultas'
  end

def lista_unidades
    $unidade = params[:computadore_unidade_id]
    @computadores = Computadore.find(:all, :conditions => ['unidade_id='+ $unidade])
    render :partial => 'lista_unidades'
  end

def consultatipo
    render 'consultastipo'
 end

def lista_tipos
    $tipo = params[:computadore_tipo_controle_id]
     @computadores = Computadore.find(:all, :conditions => ['tipo_controle_id='+ $tipo])
    render :partial => 'lista_unidades'
  end

def consultatiponome
    render 'consultastiponome'
 end

def lista_tiponome
   $tipo = params[:computadore_tipo_controle_id]
   @unidade = Unidade.find :all, :conditions => {:tipo_id => params[:computadore_tipo_controle_id]}
     render :update do |page|
      page.replace_html 'esp_unidade', :partial => 'unidade_box'
  end
end

def lista_tipounidades
    $unidade = params[:computadore_unidade_id]
    @computadores = Computadore.find(:all, :conditions => ['unidade_id=? and tipo_controle_id=?',$unidade, $tipo])
    render :partial => 'lista_unidades'
  end

def totalizaC
    @computadores = Computadore.find(:all, :order => 'unidade_id ASC')
     respond_to do |format|
       format.html # index.html.erb
      format.xml  { render :xml => @computadores }
   
    end
  end
  end
