class TipoOsexterna < ActiveRecord::Base

has_many :c_externos


  def before_save
    self.tipo.upcase!
  end

  
end
