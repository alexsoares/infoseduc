class CExterno < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :unidade
  belongs_to :tipo_osexterna, :class_name => "TipoOsexterna",:foreign_key => "tipo_id"
  has_many :documentos, :dependent => :destroy


  def before_save
    self.atendente.upcase!
    self.obs.upcase!
    end

  def encerra
   if encerrado == false then
    return "NÃO"
   else
      return "SIM"
   end

  end
end
