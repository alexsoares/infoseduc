class RelatoriosController < ApplicationController
  # GET /relatorios
  # GET /relatorios.xml

  before_filter :load_estagiarios
  before_filter :load_unidades


def load_unidades
    
  @unidades = Unidade.find(:all, :order => 'nome ASC')

  end


def load_estagiarios
 
    @estagiarios = Estagiario.find(:all, :conditions =>  ["etinerante= 1 and desligado=0"], :order => 'nome ASC')
  end


  def index
    @relatorios = Relatorio.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relatorios }
    end
  end

  # GET /relatorios/1
  # GET /relatorios/1.xml
  def show
    @relatorios = Relatorio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relatorios }
    end
  end

  # GET /relatorios/new
  # GET /relatorios/new.xml
  def new
    @relatorios = Relatorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relatorios }
    end
  end

  # GET /relatorios/1/edit
  def edit
    @relatorios = Relatorio.find(params[:id])
  end

  # POST /relatorios
  # POST /relatorios.xml
  def create
    @relatorios = Relatorio.new(params[:relatorio])

    respond_to do |format|
      if @relatorios.save
        flash[:notice] = 'RELATÓRIO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@relatorios) }
        format.xml  { render :xml => @relatorios, :status => :created, :location => @relatorios }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relatorios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relatorios/1
  # PUT /relatorios/1.xml
  def update
    @relatorios = Relatorio.find(params[:id])

    respond_to do |format|
      if @relatorios.update_attributes(params[:relatorio])
        flash[:notice] = 'RELATORIO SALVO COM SUCESSO.'
        format.html { redirect_to(@relatorios) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relatorios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorios/1
  # DELETE /relatorios/1.xml
  def destroy
    @relatorios = Relatorio.find(params[:id])
    @relatorios.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

   def consulta
    render :partial => 'consultas'
  end

def lista_relatorio
    $rel = params[:relatorio_estagiario_id]
    @relatorios = Relatorio.find(:all, :conditions => ['estagiario_id=' + $rel],  :order => 'created_at DESC')
   
    render :partial => 'lista_relatorios'
  end



end
