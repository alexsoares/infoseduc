class Unidade < ActiveRecord::Base
belongs_to :unidades_gpd
belongs_to :tipo
belongs_to :regiao
has_many :anexos
has_many :estagiarios
has_many :senhas
has_many :laboratorios
has_many :administracaos
has_many :saidas
has_many :relatorios
has_many :chamados
has_many :computadores
has_many :impressoras
has_many :datashows
has_many :departamentos
has_many :emprestimos
has_many :protocolos
has_many :c_externos
has_many :relatestagiarios
has_many :users
has_many :equipamentos

validates_presence_of :nome, :message => ' - DIGITAR NOME DA UNIDADE - '
validates_presence_of :tipo_id, :message => ' - SELECIONAR TIPO DE UNIDADE - '

  before_save :estagi
  before_update :estagi



protected

def estagi

 $teste= self.regiao_id
 if ($teste == 1 or $teste == 2 or $teste == 3 or $teste == 4 or $teste == 5)then
    self.estagiarioE = 1
  end
  
 end

  def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.diretor.upcase!
    self.coordenador.upcase!
    self.obs.upcase!

  end


  


  end
