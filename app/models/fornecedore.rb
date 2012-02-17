class Fornecedore < ActiveRecord::Base


   def before_save
    self.nome.upcase!
    self.complemento.upcase!
    self.endereco.upcase!
    self.cidade.upcase!
    self.contato.upcase!
    self.tipo_servico.upcase!
    self.aval.upcase!
    self.obs.upcase!
end


 




end
