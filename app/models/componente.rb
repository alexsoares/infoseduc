class Componente < ActiveRecord::Base

has_many :emfaltas
has_many :estoques
has_many :entradas
has_many :saidas

  def before_save
    self.nome.upcase!
end

end
