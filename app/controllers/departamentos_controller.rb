class DepartamentosController < ApplicationController
  # GET /departamentos
  # GET /departamentos.xml

  def index
    @departamentos = Departamento.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departamentos }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.xml
  def show
    @departamentos = Departamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @departamentos }
    end
  end

  # GET /departamentos/new
  # GET /departamentos/new.xml
  def new
    @departamentos = Departamento.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @departamentos }
    end
    
  end

  # GET /departamentos/1/edit
  def edit
    @departamentos = Departamento.find(params[:id])
  end

  # POST /departamentos
  # POST /departamentos.xml
  def create
    @departamentos = Departamento.new(params[:departamento])

    respond_to do |format|
      if @departamentos.save
        flash[:notice] = 'DEPARTAMENTO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_departamento_path) }
        format.xml  { render :xml => @departamentos, :status => :created, :location => @departamentos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @departamentos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departamentos/1
  # PUT /departamentos/1.xml
  def update
    @departamentos = Departamento.find(params[:id])

    respond_to do |format|
      if @departamentos.update_attributes(params[:departamentos])
        flash[:notice] = 'DEPARTAMENTO SALVO COM SUCESSO.'
        format.html { redirect_to(@departamentos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @departamentos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.xml
  def destroy
    @departamentos = Departamento.find(params[:id])
    @departamentos.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def lista
    @departamentos = Departamento.find(:all)
    render :partial => 'lista_depto'
    
  end

  def nome_unidade

    $jaexiste = params[:administracao_unidade_id]
    @verifica = Administracao.find_by_unidade_id($jaexiste)
    if @verifica then
      render :update do |page|
        page.replace_html 'aviso', :text => 'DEPARTAMENTO JÁ CADASTADO NO SISTEMA'
        page.replace_html 'Certeza', :text =>'DEPARTAMENTO JÁ CADASTADO NO SISTEMA'
    end
    else
      $unidade = params[:administracao_unidade_id]
      @administracaounidade = Unidade.find(:all, :include => 'estagiarios', :conditions => ['id =?',$unidade])
      $nomeunidade= Unidade.find_by_id($unidade).nome
       render :update do |page|
       page.replace_html 'nome_unidade', :partial => 'exibe_unidade'
       page.replace_html 'nome_aviso', :text => ''
      end

    end



  end

end
