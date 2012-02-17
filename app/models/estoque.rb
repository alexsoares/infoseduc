class Estoque < ActiveRecord::Base

 has_many :estradas
 has_many :saidas
 belongs_to :componente
  
  def before_save
    self.especifica.upcase!
    self.obs.upcase!

end

end
