class TiposProblema < ActiveRecord::Base

has_many :chamados

validates_presence_of :tipo, :message => ' -  TIPO PROBLEMA EM BRANCO - '

  def before_save
    self.tipo.upcase!
  end

end
