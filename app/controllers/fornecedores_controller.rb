class FornecedoresController < ApplicationController
  # GET /fornecedores
  # GET /fornecedores.xml


  
 def consulta
   if (params[:search].nil? || params[:search].empty?)
      @fornecedores = Fornecedore.find(:all, :order => 'nome ASC')
    else
      @fornecedores = Fornecedore.find(:all, :conditions => ["tipo_servico like ?", "%" + params[:search].to_s + "%" ])
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fornecedores }
    end
  end




  def index
   if (params[:search].nil? || params[:search].empty?)
      @fornecedores = Fornecedore.find(:all, :order => 'nome ASC')
    else
      @fornecedores = Fornecedore.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%" ], :order => 'nome ASC')
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fornecedores }
    end
  end

  # GET /fornecedores/1
  # GET /fornecedores/1.xml
  def show
    @fornecedores = Fornecedore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fornecedores }
    end
  end

  # GET /fornecedores/new
  # GET /fornecedores/new.xml
  def new
    @fornecedores = Fornecedore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fornecedores }
    end
  end

  # GET /fornecedores/1/edit
  def edit
    @fornecedores = Fornecedore.find(params[:id])
  end

  # POST /fornecedores
  # POST /fornecedores.xml
  def create
    @fornecedores = Fornecedore.new(params[:fornecedore])

    respond_to do |format|
      if @fornecedores.save
        flash[:notice] = 'FORNECEDOR CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@fornecedores) }
        format.xml  { render :xml => @fornecedores, :status => :created, :location => @fornecedores }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fornecedores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fornecedores/1
  # PUT /fornecedores/1.xml
  def update
    @fornecedores = Fornecedore.find(params[:id])

    respond_to do |format|
      if @fornecedores.update_attributes(params[:fornecedore])
        flash[:notice] = 'FORNECEDOR SALVO COM SUCESSO.'
        format.html { redirect_to(@fornecedores) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fornecedores.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.xml
  def destroy
    @fornecedores = Fornecedore.find(params[:id])
    @fornecedores.destroy

    respond_to do |format|
      format.html { redirect_to(fornecedores_url) }
      format.xml  { head :ok }
    end
  end
end
