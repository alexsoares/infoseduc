class ChamadosController < ApplicationController
  # GET /chamados
  # GET /chamados.xml
  layout :define_layout
  before_filter :login_required, :except => ["busca_protocolo"]
  before_filter :load_unidades
  before_filter :load_estagiarios
  before_filter :load_situacaos
  before_filter :load_tipos


   def busca_protocolo
    define_layout
    if (params[:search].present?)
       @chamados = Chamado.find(:all, :conditions => ["id = ?",  params[:search]])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  def index
      if (params[:search].nil? || params[:search].empty?)

        @chamados_totais = Chamado.all
        #Todos chamados não encerrados
        @chamados = Chamado.nao_encerrado

        #nivel de chamado técnico
        @chamados_aberto = Chamado.aberto
        @chamados_encerrado = Chamado.encerrado
        @chamados_terceiros = Chamado.terceiro
        @chamados_motoristas = Chamado.motorista
        @chamados_compras = Chamado.compras
        @chamados_atendimento = Chamado.atendimento
        @chamados_externo = Chamado.externo

        # Tipos de problemas
        @chamados_internet =  @chamados.problema_internet
        @chamados_impressora = @chamados.problema_impressora
        @chamados_hardware = @chamados.problema_hardware
        @chamados_software = @chamados.problema_software
        @chamados_rede = @chamados.problema_rede
        @chamados_so = @chamados.problema_so
        @chamados_user = @chamados.problema_user
        @chamados_ndefinido = @chamados.problema_nao_definido
        @chamados_outros = @chamados.outros_problema
        @chamados_servidor = @chamados.problema_servidor
        $var = 0
      else
        @chamados = Chamado.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'situacao_chamado_id,nome DESC')
        $var = 1
      end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end



  # GET /chamados/1
  # GET /chamados/1.xml
  def show
    @chamados = Chamado.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/new
  # GET /chamados/new.xml
  def new
    @chamados = Chamado.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/1/edit
  def edit
    @chamados = Chamado.find(params[:id])
  end

  # POST /chamados
  # POST /chamados.xml
  def create
    @chamados = Chamado.new(params[:chamado])
    respond_to do |format|
      if @chamados.save
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO CADASTRADA COM SUCESSO.'
        ChamadoMailer.deliver_notificar(@chamados)
        format.html { redirect_to(@chamados) }
        format.xml  { render :xml => @chamados, :status => :created, :location => @chamados }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.xml
  def update
    @chamados = Chamado.find(params[:id])
    respond_to do |format|
      if @chamados.update_attributes(params[:chamado])
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO SALVA COM SUCESSO.'
        format.html { redirect_to(chamados_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.xml
  def destroy
    @chamados = Chamado.find(params[:id])
    @chamados.destroy
    respond_to do |format|
      format.html { redirect_to(chamados_url) }
      format.xml  { head :ok }
    end
  end

  def ordemservico
    @chamados = Chamado.find(params[:id])
  end

  def encerrados

      @chamados = Chamado.find(:all, :conditions => ['situacao_chamado_id =?',2], :order => 'data_enc DESC')

      @chamadose_internet = Chamado.find(:all, :conditions => ["tipos_problema_id = 8 and situacao_chamado_id = 2"])
      @chamadose_impressora = Chamado.find(:all, :conditions => ["tipos_problema_id = 10  and situacao_chamado_id = 2"])
      @chamadose_hardware = Chamado.find(:all, :conditions => ["tipos_problema_id = 2 and situacao_chamado_id = 2"])
      @chamadose_software = Chamado.find(:all, :conditions => ["tipos_problema_id = 3 and situacao_chamado_id = 2"])
      @chamadose_rede = Chamado.find(:all, :conditions => ["tipos_problema_id = 5 and situacao_chamado_id = 2"])
      @chamadose_so = Chamado.find(:all, :conditions => ["tipos_problema_id = 4 and situacao_chamado_id = 2"])
      @chamadose_user = Chamado.find(:all, :conditions => ["tipos_problema_id = 7 and situacao_chamado_id = 2"])
      @chamadose_ndefinido = Chamado.find(:all, :conditions => ["tipos_problema_id = 1 and situacao_chamado_id = 2"])
      @chamadose_outros = Chamado.find(:all, :conditions => ["tipos_problema_id = 9 and situacao_chamado_id = 2"])
      @chamadose_servidor = Chamado.find(:all, :conditions => ["tipos_problema_id = 6 and situacao_chamado_id = 2"])
   
   
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

 def showencerrado
     @chamados = Chamado.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @chamados }
    end
 end

 def selected_print
 @chamados = Chamado.find(params[:chamado_ids])
 end

  def define_layout
    if logged_in?
      'application'
    else
      'login'
    end
  end


 protected
  def load_tipos
    @tipos = TiposProblema.find(:all)
  end

  def load_situacaos
    @situacaos = SituacaoChamado.find(:all)
  end

  def load_estagiarios
    @estagiarios = Estagiario.find(:all, :order => 'nome ASC',:conditions => ['desligado=?',0])
    @funcionarios = Estagiario.find(:all, :order => 'nome ASC',:conditions => ['desligado=?  and unidade_id=? and id<>? and id<>?',0,53,2,47])
  end

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

end