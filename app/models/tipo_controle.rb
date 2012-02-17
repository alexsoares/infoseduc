class TipoControle < ActiveRecord::Base

  has_many :computadores
  has_many :administracaos
  has_many :impressoras
  has_many :datashows

end
