class Saida < ActiveRecord::Base
  belongs_to :estoque
  belongs_to :estagiario
  belongs_to :unidade
  belongs_to :componente

def before_save
    self.obs.upcase!
end

before_save :sub_saldo


protected

def sub_saldo

     @saldo = Estoque.find(self.estoque_id)

     @saldo.saldo = @saldo.saldo - self.quantidade

     @saldo.save

  end
end
