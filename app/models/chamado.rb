class Chamado < ActiveRecord::Base
  belongs_to :estagiario
  belongs_to :tipos_problema
  belongs_to :situacao_chamado
  belongs_to :unidade

  #nivel de chamado técnico
  named_scope :nao_encerrado, :conditions => ["situacao_chamado_id != 2"], :order => "situacao_chamado_id,data_sol DESC"
  named_scope :aberto, :conditions => ["situacao_chamado_id = 1"], :order => "data_sol DESC"
  named_scope :encerrado, :conditions => ["situacao_chamado_id = 2"]
  named_scope :compras, :conditions => ["situacao_chamado_id = 3"]
  named_scope :motorista, :conditions => ["situacao_chamado_id = 4"]
  named_scope :terceiro, :conditions => ["situacao_chamado_id = 5"]
  named_scope :atendimento, :conditions => ["situacao_chamado_id = 6"]
  named_scope :externo, :conditions => ["situacao_chamado_id = 7"]


  # Tipos de problemas
  named_scope :problema_nao_definido, :conditions => ["tipos_problema_id = 1"]
  named_scope :problema_hardware, :conditions => ["tipos_problema_id = 2"]
  named_scope :problema_software, :conditions => ["tipos_problema_id = 3"]
  named_scope :problema_so, :conditions => ["tipos_problema_id = 4"]
  named_scope :problema_rede, :conditions => ["tipos_problema_id = 5"]
  named_scope :problema_servidor, :conditions => ["tipos_problema_id = 6"]
  named_scope :problema_user, :conditions => ["tipos_problema_id = 7"]
  named_scope :problema_internet, :conditions => ["tipos_problema_id = 8"]
  named_scope :outros_problema, :conditions => ["tipos_problema_id = 9"]
  named_scope :problema_impressora, :conditions => ["tipos_problema_id = 10"]



  attr_accessor :check_print

  def before_save
    self.solicitante.upcase!
    self.problema.upcase!

    
end

end
