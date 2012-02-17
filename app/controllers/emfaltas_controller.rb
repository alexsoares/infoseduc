class EmfaltasController < ApplicationController
  # GET /emfaltas
  # GET /emfaltas.xml

   before_filter :load_componentes

def load_componentes
    @componentes = Componente.find(:all, :order => 'nome ASC')
end

  def index
     if (params[:search].nil? || params[:search].empty?)
        @emfaltas = Emfalta.find(:all, :joins => :componente, :order => 'componentes.nome ASC')
      $var = 0
      else
       @emfaltas = Emfalta.find(:all, :joins => :componente, :conditions => ["componentes.nome like ?", "%" + params[:search].to_s + "%"], :order => 'componentes.nome ASC')
       
      $var=1

    end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emfaltas }
    end
  end

  # GET /emfaltas/1
  # GET /emfaltas/1.xml
  def show
    @emfaltas = Emfalta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emfaltas }
    end
  end

  # GET /emfaltas/new
  # GET /emfaltas/new.xml
  def new
    @emfaltas = Emfalta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emfaltas }
    end
  end

  # GET /emfaltas/1/edit
  def edit
    @emfaltas = Emfalta.find(params[:id])
  end

  # POST /emfaltas
  # POST /emfaltas.xml
  def create
    @emfaltas = Emfalta.new(params[:emfalta])

    respond_to do |format|
      if @emfaltas.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@emfaltas) }
        format.xml  { render :xml => @emfaltas, :status => :created, :location => @emfalta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emfaltas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emfaltas/1
  # PUT /emfaltas/1.xml
  def update
    @emfaltas = Emfalta.find(params[:id])

    respond_to do |format|
      if @emfaltas.update_attributes(params[:emfalta])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@emfaltas) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emfaltas.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emfaltas/1
  # DELETE /emfaltas/1.xml
  def destroy
    @emfaltas = Emfalta.find(params[:id])
    @emfaltas.destroy

    respond_to do |format|
      format.html { redirect_to(emfaltas_url) }
      format.xml  { head :ok }
    end
  end
end
