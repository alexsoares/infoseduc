class CExternosController < ApplicationController
  before_filter :load_resources
  before_filter :load_unidades
  before_filter :load_tipo


   def load_tipo
    @tipo_osexterna = TipoOsexterna.find(:all, :order => 'tipo ASC')
  end


   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end



    def index
      if (params[:search].nil? || params[:search].empty?)
       @c_externos = CExterno.all
       #$var = 0
    else
      @c_externos = CExterno.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      #$var=1
    end


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @c_externos }
    end
  end

  # GET /c_externos/1
  # GET /c_externos/1.xml
  def show
    @c_externo = CExterno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @c_externo }
    end
  end

  # GET /c_externos/new
  # GET /c_externos/new.xml
  def new
    @c_externo = CExterno.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @c_externo }
    end
  end

  # GET /c_externos/1/edit
  def edit
    @c_externo = CExterno.find(params[:id])
  end

  # POST /c_externos
  # POST /c_externos.xml
  def create
    @c_externo = CExterno.new(params[:c_externo])

    respond_to do |format|
      if @c_externo.save
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO CADASTRADA COM SUCESSO.'
        format.html { redirect_to(@c_externo) }
        format.xml  { render :xml => @c_externo, :status => :created, :location => @c_externo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @c_externo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /c_externos/1
  # PUT /c_externos/1.xml
  def update
    @c_externo = CExterno.find(params[:id])

    respond_to do |format|
      if @c_externo.update_attributes(params[:c_externo])
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO SALVO COM SUCESSO.'
        format.html { redirect_to(@c_externo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @c_externo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /c_externos/1
  # DELETE /c_externos/1.xml
  def destroy
    @c_externo = CExterno.find(params[:id])
    @c_externo.destroy

    respond_to do |format|
      format.html { redirect_to(c_externos_url) }
      format.xml  { head :ok }
    end
  end

   def ordemservico
      @c_externo = CExterno.find(params[:id])
  end
  
  def servicos
    @servico = Empresa.all(:conditions => ["id = ?", params[:c_externo_empresa_id]])
    render :partial => "servicos"
  end

   def consultatipo
    render 'consulta_tipo'
  end

def lista_tipo
    $tipo = params[:c_externo_tipo_id]
    @c_externos = CExterno.find(:all, :conditions => ['tipo_id=' + $tipo])
    render :partial => 'lista_tipo'
  end

 def consultaunidade
    render 'consulta_unidade'
  end

def lista_unidade
    $unidade = params[:c_externo_unidade_id]
    @c_externos = CExterno.find(:all, :conditions => ['unidade_id=' + $unidade])
    render :partial => 'lista_tipo'
  end


def exencerra
    @c_externos = CExterno.find(:all, :conditions => ['situacao =?',1], :order => 'data_encerra DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @c_externos }
    end
  end


  protected

  def load_resources
    @empresas = Empresa.all
  end


end
