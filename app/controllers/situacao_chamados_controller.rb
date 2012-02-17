class SituacaoChamadosController < ApplicationController
  # GET /situacao_chamados
  # GET /situacao_chamados.xml

    layout "application"

  def index
    @situacao_chamados = SituacaoChamado.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @situacao_chamados }
    end
  end

  # GET /situacao_chamados/1
  # GET /situacao_chamados/1.xml
  def show
    @situacao_chamados = SituacaoChamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @situacao_chamados }
    end
  end

  # GET /situacao_chamados/new
  # GET /situacao_chamados/new.xml
  def new
    @situacao_chamados = SituacaoChamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @situacao_chamados }
    end
  end

  # GET /situacao_chamados/1/edit
  def edit
    @situacao_chamados = SituacaoChamado.find(params[:id])
  end

  # POST /situacao_chamados
  # POST /situacao_chamados.xml
  def create
    @situacao_chamados = SituacaoChamado.new(params[:situacao_chamado])

    respond_to do |format|
      if @situacao_chamados.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_situacao_chamado_path) }
        format.xml  { render :xml => @situacao_chamados, :status => :created, :location => @situacao_chamados }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @situacao_chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /situacao_chamados/1
  # PUT /situacao_chamados/1.xml
  def update
    @situacao_chamados = SituacaoChamado.find(params[:id])

    respond_to do |format|
      if @situacao_chamados.update_attributes(params[:situacao_chamado])
        flash[:notice] = 'SituacaoChamados was successfully updated.'
        format.html { redirect_to(@situacao_chamados) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @situacao_chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /situacao_chamados/1
  # DELETE /situacao_chamados/1.xml
  def destroy
    @situacao_chamados = SituacaoChamado.find(params[:id])
    @situacao_chamados.destroy

    respond_to do |format|
      format.html { redirect_to(new_situacao_chamado_path) }
      format.xml  { head :ok }
    end
  end

  def lista
    @situacao_chamados = SituacaoChamado.find(:all)
    render :partial => 'lista_tipo'

  end
end
