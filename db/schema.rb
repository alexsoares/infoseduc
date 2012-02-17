# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120210121327) do

  create_table "administracaos", :force => true do |t|
    t.integer  "unidade_id",       :null => false
    t.integer  "tipo_controle_id"
    t.string   "servidor"
    t.string   "rede"
    t.string   "internet"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anexos", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "unidade_id"
  end

  create_table "c_externos", :force => true do |t|
    t.integer  "empresa_id"
    t.string   "atendente"
    t.datetime "data_hora"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "protocolo"
    t.integer  "unidade_id"
    t.integer  "tipo_id"
    t.integer  "tipo"
    t.integer  "situacao",     :default => 0, :null => false
    t.datetime "data_encerra"
  end

  create_table "chamados", :force => true do |t|
    t.datetime "data_sol"
    t.string   "solicitante"
    t.integer  "unidade_id"
    t.string   "depto"
    t.string   "forma_sol"
    t.text     "problema"
    t.datetime "data_aten"
    t.integer  "estagiario_id"
    t.integer  "tipos_problema_id"
    t.integer  "patrimonio"
    t.string   "local"
    t.string   "procedimentos"
    t.integer  "situacao_chamado_id", :default => 1
    t.datetime "data_enc"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "chats", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "chats_users", :id => false, :force => true do |t|
    t.integer "chat_id", :null => false
    t.integer "user_id", :null => false
  end

  create_table "componentes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computadores", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant",            :default => 0
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contato_internos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contatos", :force => true do |t|
    t.string   "nome"
    t.integer  "telefone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datashows", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant"
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departamentos", :force => true do |t|
    t.integer  "unidade_id", :default => 53
    t.string   "depto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentos", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "c_externo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "documento_file_name"
    t.string   "documento_content_type"
    t.integer  "documento_file_size"
    t.datetime "documento_updated_at"
  end

  create_table "emfaltas", :force => true do |t|
    t.integer  "componente_id"
    t.string   "especifica"
    t.integer  "quant"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.string   "tipo_servico"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprestimos", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "departamento_id", :default => 1
    t.datetime "emprestimo"
    t.datetime "devolucao"
    t.string   "responsavel"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entradas", :force => true do |t|
    t.integer  "componente_id"
    t.integer  "estoque_id"
    t.integer  "quantidade"
    t.datetime "data_ent"
    t.string   "procedencia"
    t.string   "NF"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipamentos", :force => true do |t|
    t.string   "equipamento"
    t.string   "pat"
    t.string   "configuracao"
    t.integer  "unidade_id"
    t.datetime "dataent"
    t.string   "estado"
    t.string   "providencia"
    t.string   "procedimento"
    t.string   "instalacao"
    t.datetime "dataexec"
    t.string   "destinacao"
    t.string   "trouxe"
    t.integer  "estagiario_id"
    t.datetime "datasaida"
    t.integer  "os"
    t.integer  "encerrado",     :default => 0
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estagiarios", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "regiao_id"
    t.string   "nome"
    t.string   "RG"
    t.string   "CPF"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "cel"
    t.string   "email"
    t.datetime "data_nasc"
    t.string   "faculdade"
    t.string   "matricula"
    t.string   "periodo_est"
    t.string   "responsavel"
    t.datetime "data_ingresso"
    t.datetime "data_termino"
    t.datetime "data_admissao"
    t.datetime "data_desliga"
    t.string   "locacao"
    t.string   "periodo_trab"
    t.string   "aval"
    t.string   "obs"
    t.integer  "flag",               :default => 0
    t.integer  "desligado",          :default => 0
    t.integer  "etinerante",         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "estoques", :force => true do |t|
    t.integer  "componente_id",                :null => false
    t.string   "especifica"
    t.integer  "saldo",         :default => 0
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fornecedores", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "fone"
    t.string   "cel"
    t.string   "email"
    t.string   "contato"
    t.string   "tipo_servico"
    t.string   "aval"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressoras", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant"
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informativos", :force => true do |t|
    t.text     "mensagem"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itinerarios", :force => true do |t|
    t.integer  "estagiario_id"
    t.integer  "unidade_id"
    t.date     "data_visita"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "justificativas", :force => true do |t|
    t.integer  "ponto_id"
    t.text     "justificativa"
    t.boolean  "entrada",         :default => false
    t.boolean  "saida",           :default => false
    t.date     "dia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estagiario_id"
    t.boolean  "cumpriu_horario"
    t.integer  "qtd_hrs"
    t.datetime "hora_saida"
    t.boolean  "feriadosssss",    :default => false, :null => false
    t.boolean  "feriado"
    t.boolean  "fimsemana"
    t.boolean  "recesso"
  end

  create_table "mes_bases", :force => true do |t|
    t.date     "data"
    t.integer  "mes"
    t.integer  "qtde_dias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.text     "corpo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.string   "descricao_curta"
  end

  create_table "online_users", :force => true do |t|
    t.string   "username"
    t.date     "last_seen"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "chat_session"
  end

  create_table "pontos", :force => true do |t|
    t.integer  "estagiario_id"
    t.integer  "feriado",          :default => 0, :null => false
    t.datetime "entrada"
    t.datetime "saida"
    t.integer  "total_trabalhado", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ano"
    t.integer  "mes"
  end

  create_table "protocolos", :force => true do |t|
    t.integer  "unidade_id"
    t.string   "problema"
    t.integer  "estagiario_id"
    t.datetime "data_sol"
    t.string   "solicitado"
    t.string   "atendente"
    t.string   "solicitacao"
    t.string   "protocolo"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regiaos", :force => true do |t|
    t.string   "regiao"
    t.string   "local"
    t.string   "unidade"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatestagiarios", :force => true do |t|
    t.integer  "estagiario_id"
    t.integer  "unidade_id"
    t.string   "periodo"
    t.datetime "datahora"
    t.string   "responsavel"
    t.text     "ocorrencia"
    t.string   "providencia",   :limit => 800
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "validacao",                    :default => false
    t.string   "nome"
  end

  create_table "relatorios", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "estagiario_id"
    t.string   "responsavel"
    t.datetime "data"
    t.string   "problema"
    t.string   "procedimentos"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "saidas", :force => true do |t|
    t.integer  "componente_id"
    t.integer  "estoque_id"
    t.integer  "estagiario_id"
    t.integer  "unidade_id"
    t.integer  "quantidade"
    t.datetime "data_saida"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senhas", :force => true do |t|
    t.integer  "unidade_id", :null => false
    t.string   "de"
    t.string   "usuario"
    t.string   "senha"
    t.string   "fone"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situacao_chamados", :force => true do |t|
    t.string   "situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temps", :force => true do |t|
    t.string   "nome"
    t.integer  "telefone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_controles", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_osexternas", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_problemas", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", :force => true do |t|
    t.integer  "tipo_id",                    :null => false
    t.integer  "regiao_id"
    t.string   "nome"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "email"
    t.string   "diretor"
    t.string   "coordenador"
    t.string   "obs"
    t.integer  "estagiarioM", :default => 0, :null => false
    t.integer  "estagiarioV", :default => 0, :null => false
    t.integer  "estagiarioE", :default => 0, :null => false
    t.integer  "estagiarioN", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "unidade_id"
    t.string   "password_reset_code"
  end

end
