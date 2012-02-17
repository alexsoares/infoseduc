class ChatsController < ApplicationController
  before_filter :login_required
  require_role "administrador", :for => ['destroy']
  # GET /chat_rooms
  # GET /chat_rooms.xml
  before_filter :load_resources
  def index
    @classes = Aluno.all(:select => "id_classe, classe_descricao, classe_ano, id_escola",:conditions => ["classe_ano = 2011 and id_escola = ?", current_user.unidade.unidades_gpd_id], :group => ["id_classe,classe_descricao, classe_ano,id_escola"] , :order => "classe_descricao")
  end

  def busca
    if params[:pessoa].present?
      if params[:pessoa][:nome].present?
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome(?,1))",session[:ano_letivo].to_i,params[:pessoa][:nome]])
      else
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null)",session[:ano_letivo].to_i])
      end
          #@alunos = Aluno.all(:conditions => ["(classe_ano = 2011 or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome('JOAO',1) and pes_dtnasc = '2002-01-06')",])
          render :update do |page|
            page.replace_html 'pessoas', :partial => "pessoas"
          end

      end

  end
  def classe
    session[:classe] = params[:classe][:id_classe]
    session[:ano_letivo] = params[:classe][:ano_letivo]
    if params[:classe].present?
          render :update do |page|
            page.replace_html 'classe', :partial => "listagem"
          end          
    end    
  end




  # GET /chat_rooms/1
  # GET /chat_rooms/1.xml
  def show
    @chat = Chat.find(params[:id])
    session[:chat_id] = params[:id]
    @onlineusers = OnlineUser.find_by_user_id(current_user.id)
    if @onlineusers.present?
      @onlineusers.last_seen = Time.now
      if @onlineusers.chat_session.present?
        if (@onlineusers.chat_session).to_i != (session[:chat_id]).to_i
          render :juggernaut => {:type => :send_to_channels, :channels => [@onlineusers.chat_session.to_i] } do |page|
            page.replace_html "user_#{current_user.id}", "<p><b style='color:red'>#{current_user.name}</b></p>"
          end
          @onlineusers.chat_session = session[:chat_id]
        end
      else
        @onlineusers.chat_session = session[:chat_id]
        @onlineusers.online = 1
        @onlineusers.username = current_user.name ? current_user.name : current_user.login
      end
      @onlineusers.save
    else
      @onlineusers = OnlineUser.new
      @onlineusers.last_seen = Time.now
      @onlineusers.online = 1
      @onlineusers.chat_session = session[:chat_id]
      @onlineusers.username = current_user.name ? current_user.name : current_user.login
      @onlineusers.save
    end
        render :juggernaut => {:type => :send_to_channels, :channels => [session[:chat_id].to_i] } do |page|
          page.insert_html :bottom, 'chat_room', "<p>#{current_user.login}: Entrou a Sala </p>"
          page.replace_html "user_#{current_user.id}", "<p><b style='color:green'>#{current_user.name}</b></p>"
        end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chat}
    end
  end

  # GET /chat_rooms/new
  # GET /chat_rooms/new.xml
  def new
    @chat = Chat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chat}
    end
  end

  # GET /chat_rooms/1/edit
  def edit
    @chat= Chat.find(params[:id])
  end

  # POST /chat_rooms
  # POST /chat_rooms.xml
  def create
    @chat = Chat.new(params[:chat])
    @chat.nome = "#{@chat.nome} - #{Time.now.strftime("%d/%m/%Y - %H:%M")}"
    @chat.user_id = current_user.id
    respond_to do |format|
      if @chat.save
        flash[:notice] = 'BATE PAPO INICIADO.'
        @chat.users.each do |c|
          ChamadoMailer.deliver_chat(c,@chat)
        end
        format.html { redirect_to(@chat) }
        format.xml  { render :xml => @chat, :status => :created, :location => @chat}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chat_rooms/1
  # PUT /chat_rooms/1.xml
  def update
    @chat = Chat.find(params[:id])

    respond_to do |format|
      if @chat.update_attributes(params[:chat])
        flash[:notice] = 'BATE PAPO ATUALIZADO.'
        format.html { redirect_to(@chat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_rooms/1
  # DELETE /chat_rooms/1.xml
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to(chats_url) }
      format.xml  { head :ok }
    end
  end

  def send_data   
    render :juggernaut do |page|
      page.insert_html :bottom, 'chat_room', "<li>#{current_user.name}-(#{current_user.login}): #{h params[:chat_input]} #{Time.now.strftime("%d/%m/%Y - %H:%M")}</li>"
    end
    render :nothing => true
  end

  def desconectar
      @onlineusers = OnlineUser.find_by_user_id(current_user.id)
      if @onlineusers.present?
        @onlineusers.online = false
        @onlineusers.chat_session = nil
        @onlineusers.save
        render :juggernaut => {:type => :send_to_channels, :channels => [session[:chat_id].to_i] } do |page|
          page.insert_html :bottom, 'chat_room', "<p>#{current_user.name}-(#{current_user.login}): Abandonou a Sala </p>"
          page.replace_html "user_#{current_user.id}", "<p><b style='color:red'>#{current_user.name}</b></p>"
        end
      end
      respond_to do |format|
          format.html { redirect_to(chats_url) }
          format.xml  { head :ok }
          format.js
      end
      @sala_chat = Chat.find(session[:chat_id])
      flash[:notice] = "BATE PAPO ENCERRADO #{@sala_chat.nome}"
  end

  protected

  def load_resources
    @users = User.all(:order => "name")
    @users_admin = User.all(:joins => ' INNER JOIN roles_users ON  users.id=roles_users.user_id INNER JOIN roles ON roles.id=roles_users.role_id', :conditions => ["roles.name = 'administrador' or users.id = ?", current_user.id])
  end

end
