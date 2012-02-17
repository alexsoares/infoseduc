class Entrada < ActiveRecord::Base
 
  belongs_to :componente
  belongs_to :estoque
before_create :soma_saldo


def before_save
    self.procedencia.upcase!
    self.obs.upcase!
end

protected

def soma_saldo

     @saldo = Estoque.find(self.estoque_id)

     @saldo.saldo = @saldo.saldo + self.quantidade

     @saldo.save

  end



end
