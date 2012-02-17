class Senha < ActiveRecord::Base

belongs_to :unidade


 def before_save
    self.de.upcase!
    self.obs.upcase!
 end

end
