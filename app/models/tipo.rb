class Tipo < ActiveRecord::Base

has_many :unidades

validates_presence_of :nome, :message => ' - TIPO UNIDADE EM BRANCO - '

  def before_save
    self.nome.upcase!
end


end
