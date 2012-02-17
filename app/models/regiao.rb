class Regiao < ActiveRecord::Base

has_many :unidades
has_many :estagiarios

   def before_save
    self.regiao.upcase!
    self.local.upcase!
    self.unidade.upcase!
    self.obs.upcase!
end
end
