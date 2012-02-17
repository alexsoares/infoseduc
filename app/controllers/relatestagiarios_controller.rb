class RelatestagiariosController < ApplicationController
  # GET /relatestagiarios
  # GET /relatestagiarios.xml
  before_filter :load_estagiarios
  before_filter :load_unidades
  layout "application"
    
def load_unidades
  @unidades = Unidade.find(:all, :order => 'nome ASC')
end


def load_estagiarios

    @estagiarios = Estagiario.find(:all, :conditions =>  ["etinerante= 0 and desligado=0 and flag =0"], :order => 'nome ASC')
  end

  def index
    @relatestagiarios = Relatestagiario.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'datahora DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relatestagiarios }
    end
  end

  # GET /relatestagiarios/1
  # GET /relatestagiarios/1.xml
  def show
    @relatestagiario = Relatestagiario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relatestagiario }
    end
  end

  # GET /relatestagiarios/new
  # GET /relatestagiarios/new.xml
  def new
    @relatestagiario = Relatestagiario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relatestagiario }
    end
  end

  # GET /relatestagiarios/1/edit
  def edit
    @relatestagiario = Relatestagiario.find(params[:id])
  end



  # POST /relatestagiarios
  # POST /relatestagiarios.xml
  def create
    @relatestagiario = Relatestagiario.new(params[:relatestagiario])

    respond_to do |format|
      if @relatestagiario.save
        flash[:notice] = 'RELATÓRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@relatestagiario) }
        format.xml  { render :xml => @relatestagiario, :status => :created, :location => @relatestagiario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relatestagiario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relatestagiarios/1
  # PUT /relatestagiarios/1.xml
  def update
    @relatestagiario = Relatestagiario.find(params[:id])

    respond_to do |format|
      if @relatestagiario.update_attributes(params[:relatestagiario])
        flash[:notice] = 'RELATÓRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@relatestagiario) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relatestagiario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relatestagiarios/1
  # DELETE /relatestagiarios/1.xml
  def destroy
    @relatestagiario = Relatestagiario.find(params[:id])
    @relatestagiario.destroy

    respond_to do |format|
      format.html { redirect_to(relatestagiarios_url) }
      format.xml  { head :ok }
    end
  end

  def consulta
    render :partial => 'consultas'
  end

def lista_relatorio
    $rel = params[:relatestagiario_estagiario_id]
    @relatestagiarios = Relatestagiario.find(:all, :conditions => ['estagiario_id=' + $rel],  :order => 'created_at DESC')
    render :partial => 'lista_relatorios'
end

def validacao
  unless (session[:validade].present?)
    @validation = Relatestagiario.search(params[:validate])
    unless params[:validate].nil?
      if (SENHA != params[:validate])
       flash[:notice] = 'SENHA INVALIDA.'
       redirect_to validacao_relatestagiarios_path(:id =>params[:id])
      else
        session[:validade] = SENHA
        redirect_to edit_relatestagiario_path(:id =>params[:id])
        #render :action => "validar",:id =>params[:id]
      end
    end
  else
    redirect_to edit_relatestagiario_path(:id =>params[:id])
  end
end


end
