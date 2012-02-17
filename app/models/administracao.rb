class Administracao < ActiveRecord::Base

  belongs_to :unidade
  belongs_to :tipo_controle
  has_many :admin_comps
  has_many :admin_imps


  def before_save
    self.servidor.upcase!
    self.rede.upcase!
    self.internet.upcase!
    self.obs.upcase!
  end


 

end
