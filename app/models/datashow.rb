class Datashow < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :tipo_controle

validates_presence_of :unidade_id, :message => ' - SELECIONAR UNIDADE  - '




def before_save
    self.config.upcase!
    self.user.upcase!
    self.contato.upcase!
    self.pertence.upcase!
end
end
