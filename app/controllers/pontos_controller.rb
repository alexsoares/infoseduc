class PontosController < ApplicationController
  before_filter :load_estagiarios
  # GET /pontos
  # GET /pontos.xml
  def index
   @date = params[:month] ? Date.parse(params[:month]) : Date.today
   @search = Ponto.search(params[:search])

   if !(params[:search].blank?)
    @ponto = @search.all
    @ponto_estagiario = @search.first
    inicio_mes = "#{@date.year}-#{(((@date.month).to_i) -1)}-21"
    termino_mes ="#{@date.year}-#{((@date.month).to_i)}-20"
    @total_trabalhado = Ponto.find_by_estagiario_id(params[:search][:estagiario_id_equals], :conditions => ["created_at between ? and ?", inicio_mes,termino_mes], :select => "sum(total_trabalhado) as total_trabalhado_geral", :order => "entrada")
    #@total_justificativa = Justificativa.find_by_estagiario_id(params[:search][:estagiario_id_equals], :conditions => ["dia between ? and ?", inicio_mes,termino_mes], :select => "sum(qtd_hrs) as total_justificado")
   end
  end

  # GET /pontos/1
  # GET /pontos/1.xml
  def show
    @ponto = Ponto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ponto }
    end
  end

  # GET /pontos/new
  # GET /pontos/new.xml
  def new
    @ponto = Ponto.new
    @t = params[:estagiario_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ponto }
    end
  end

  # GET /pontos/1/edit
  def edit
    @ponto = Ponto.find(params[:id])
  end

  # POST /pontos
  # POST /pontos.xml
  def create
    @ponto = Ponto.new(params[:ponto])
    @ponto.entrada = Time.now

    respond_to do |format|
      if @ponto.save
        flash[:notice] = 'ENTRADA REALIZADA COM SUCESSO.'
        format.html { redirect_to(@ponto) }
        format.xml  { render :xml => @ponto, :status => :created, :location => @ponto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ponto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pontos/1
  # PUT /pontos/1.xml
  def update
    @ponto = Ponto.find(params[:id])
    @ponto.saida = Time.now
    @ponto.total_trabalhado = ((@ponto.saida.to_i - @ponto.entrada.to_i ) / 60)
    respond_to do |format|
      if @ponto.update_attributes(params[:ponto])

        flash[:notice] = 'SAÍDA REALIZADA COM SUCESSO.'
        format.html { redirect_to(@ponto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ponto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pontos/1
  # DELETE /pontos/1.xml
  def destroy
    @ponto = Ponto.find(params[:id])
    @ponto.destroy

    respond_to do |format|
      format.html { redirect_to(pontos_url) }
      format.xml  { head :ok }
    end
  end

  def load_estagiarios
    @estagiarios = type_user(current_user.unidade_id)
  end

  def type_user(unit)
    if  unit == 53 or unit == 100
      # type = 53 => usuário administrativo
      @estagiarios = Estagiario.find(:all, :conditions =>  ["desligado=0 and flag = 0"], :order => 'nome ASC')
    else
      if unit == 99
        # type = 99 => usuário itinerante
        #@regiao = Regiao.all
        @estagiarios = Estagiario.find(:all, :conditions =>  ["desligado=0 and flag = 0 and unidade_id is ?", nil], :order => 'nome ASC')
      else
        @estagiarios = Estagiario.find(:all, :conditions =>  ["desligado=0 and flag = 0 and unidade_id = ?", unit], :order => 'nome ASC')
      end
    end
  end

end
