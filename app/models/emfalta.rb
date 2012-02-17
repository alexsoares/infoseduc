class Emfalta < ActiveRecord::Base
  belongs_to :componente

  def before_save
    self.especifica.upcase!
    self.obs.upcase!

end
end
