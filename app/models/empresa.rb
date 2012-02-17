class Empresa < ActiveRecord::Base
  has_many :c_externos, :dependent => :destroy

 def before_save
    self.nome.upcase!
    self.tipo_servico.upcase!
 end

end
