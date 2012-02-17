class SenhasController < ApplicationController
  # GET /senhas
  # GET /senhas.xml

  before_filter :load_unidades

   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  def index
    
     if (params[:search].nil? || params[:search].empty?)
      @senhas = Senha.paginate :page => params[:page],:joins => :unidade, :order => 'nome ASC', :per_page => 20
      $var=0
    else
       @senhas = Senha.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
       $var=1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @senhas }
    end
  end

  # GET /senhas/1
  # GET /senhas/1.xml
  def show
    @senhas = Senha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @senhas }
    end
  end

  # GET /senhas/new
  # GET /senhas/new.xml
  def new
    @senhas = Senha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @senhas }
    end
  end

  # GET /senhas/1/edit
  def edit
    @senhas = Senha.find(params[:id])
  end

  # POST /senhas
  # POST /senhas.xml
  def create
    @senhas = Senha.new(params[:senha])

    respond_to do |format|
      if @senhas.save
        flash[:notice] = 'SENHA CADASTRADA COM SUCESSO.'
        format.html { redirect_to(senhas_path) }
        format.xml  { render :xml => @senhas, :status => :created, :location => @senhas }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @senhas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /senhas/1
  # PUT /senhas/1.xml
  def update
    @senhas = Senha.find(params[:id])

    respond_to do |format|
      if @senhas.update_attributes(params[:senha])
        flash[:notice] = 'SENHA SALVA COM SUCESSO.'
        format.html { redirect_to(senhas_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @senhas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /senhas/1
  # DELETE /senhas/1.xml
  def destroy
    @senhas = Senha.find(params[:id])
    @senhas.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

 def nome_unidade
   $unidade = params[:senha_unidade_id]
   @senhaunidade = Unidade.find(:all, :include => 'estagiarios', :conditions => ['id =?',$unidade])
   $nomeunidade= Unidade.find_by_id($unidade).nome
     render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
    end
  end
end
