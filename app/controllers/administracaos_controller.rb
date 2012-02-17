class AdministracaosController < ApplicationController
  # GET /administracaos
  # GET /administracaos.xml
  layout "application"
   before_filter :load_unidades
   before_filter :load_administracaos
   before_filter :load_tipocontroles

  def index
   @administracaos = Administracao.find(:all)
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administracaos }
    end
  end

  # GET /administracaos/1
  # GET /administracaos/1.xml
  def show
    @administracaos = Administracao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administracaos }
    end
  end

  # GET /administracaos/new
  # GET /administracaos/new.xml
  def new
    @administracaos = Administracao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administracaos }
    end
  end

  # GET /administracaos/1/edit
  def edit
    @administracaos = Administracao.find(params[:id])
  end

  # POST /administracaos
  # POST /administracaos.xml
  def create
    @administracaos = Administracao.new(params[:administracao])

    respond_to do |format|
      if @administracaos.save
        flash[:notice] = 'SALVO COM SUCESSO'
        format.html { redirect_to(@administracaos) }
        format.xml  { render :xml => @administracaos, :status => :created, :location => @administracaos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administracaos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administracaos/1
  # PUT /administracaos/1.xml
  def update
    @administracaos = Administracao.find(params[:id])

    respond_to do |format|
      if @administracaos.update_attributes(params[:administracao])
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@administracaos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administracaos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administracaos/1
  # DELETE /administracaos/1.xml
  def destroy
    @administracaos = Administracao.find(params[:id])
    @administracaos.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

  def unidade_nome
    $jaexiste = params[:administracao_unidade_id]
    @verifica = Administracao.find_by_unidade_id($jaexiste)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'EQUIPAMENTOS ADMINISTRAÇÃO JÁ CADASTADO NO SISTEMA'
        page.replace_html 'Certeza', :text =>'EQUIPAMENTOS ADMINISTRAÇÃO JÁ CADASTADO NO SISTEMA'
      end
    else
      $unidade = params[:administracao_unidade_id]
      @administracaounidade = Unidade.find(:all, :include => 'administracaos', :conditions => ['id =?',$unidade])
      $nomeunidade= Unidade.find_by_id($unidade).nome
      render :update do |page|
        page.replace_html 'nome_unidade', :partial => 'exibe_unidade'
      end
    end
  end

  def consulta
    render 'consultas'
  end


  def lista_unidades
    $unidade = params[:administracao_unidade_id]
    @administracao = Administracao.find(:all, :conditions => ['unidade_id='+ $unidade])
    render :partial => 'lista_unidades'
  end

  def consultatipo
    render 'consultastipo'
  end

  def consultatiponome
    render 'consultastiponome'
  end

  def lista_tipos
    $tipo = params[:administracao_tipo_controle_id]
    @administracao = Administracao.find(:all, :conditions => ['tipo_controle_id='+ $tipo])
    render :partial => 'lista_unidades'
  end

  def lista_tiponome
    $tipo = params[:administracao_tipo_controle_id]
    @unidade = Unidade.find :all, :conditions => {:tipo_id => params[:administracao_tipo_controle_id]}
    render :update do |page|
      page.replace_html 'esp_unidade', :partial => 'unidade_box'
    end
  end

  def lista_tipounidades
    $unidade = params[:administracao_unidade_id]
    @administracao = Administracao.find(:all, :conditions => ['unidade_id=? and tipo_controle_id=?',$unidade, $tipo])
    render :partial => 'lista_unidades'
  end

  def termo_servico
    
  end

 def internet
    if !(params[:servidor].present?)
      @administracaos = Administracao.find(:all, :joins => :unidade, :order => 'nome ASC')
    end
  end


protected

  def load_tipocontroles
    @tipo_controles = TipoControle.find(:all)
  end

  def load_administracaos
    @administracaos = Administracao.find(:all)
  end

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

end
