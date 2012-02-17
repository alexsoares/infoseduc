class EquipamentosController < ApplicationController
  # GET /equipamentos
  # GET /equipamentos.xml
     before_filter :load_unidades
   before_filter :load_estagiarios


def load_estagiarios
    @estagiarios =Estagiario.find(:all, :conditions => ["desligado=?",0], :order => 'nome ASC')
  end
   
   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def consulta
    if (params[:search].present?)
         @equipamentos = Equipamento.find(:all, :conditions => [ "id = ? and encerrado =?",  params[:search], 0 ])
    end

      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipamentos }
    end
  end

def encerrado
    if (params[:search].nil? || params[:search].empty?)
      @equipamentos = Equipamento.find(:all, :conditions => ["encerrado =?", 1])
    else
      @equipamentos = Equipamento.find(:all, :conditions => ["encerrado =? and equipamento like ?", 1,"%" + params[:search].to_s + "%" ])
    end

   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipamentos }
    end
  end

  def index
    if (params[:search].nil? || params[:search].empty?)
      @equipamentos = Equipamento.find(:all, :conditions => ["encerrado =?", 0])
    else
      @equipamentos = Equipamento.find(:all, :conditions => ["encerrado =? and equipamento like ?", 0,"%" + params[:search].to_s + "%" ])
    end

   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipamentos }
    end
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.xml
  def show
    @equipamento = Equipamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipamento }
    end
  end

  # GET /equipamentos/new
  # GET /equipamentos/new.xml
  def new
    @equipamento = Equipamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipamento }
    end
  end

  # GET /equipamentos/1/edit
  def edit
    @equipamento = Equipamento.find(params[:id])
  end

  # POST /equipamentos
  # POST /equipamentos.xml
  def create
    @equipamento = Equipamento.new(params[:equipamento])

    respond_to do |format|
      if @equipamento.save
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@equipamento) }
        format.xml  { render :xml => @equipamento, :status => :created, :location => @equipamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipamentos/1
  # PUT /equipamentos/1.xml
  def update
    @equipamento = Equipamento.find(params[:id])

    respond_to do |format|
      if @equipamento.update_attributes(params[:equipamento])
        flash[:notice] = 'SALVO COM SUCESSO.'
        format.html { redirect_to(@equipamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.xml
  def destroy
    @equipamento = Equipamento.find(params[:id])
    @equipamento.destroy

    respond_to do |format|
      format.html { redirect_to(equipamentos_url) }
      format.xml  { head :ok }
    end
  end
end
