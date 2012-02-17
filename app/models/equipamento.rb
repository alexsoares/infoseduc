class Equipamento < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :estagiario



  def encerra
   if encerrado == false then
    return "NÃO"
   else
      return "SIM"
   end

  end

def before_save
    self.trouxe.upcase!
    self.configuracao.upcase!
    self.providencia.upcase!
end


def before_update
    self.procedimento.upcase!
    self.instalacao.upcase!
    self.destinacao.upcase!
    self.obs.upcase!
end


end
