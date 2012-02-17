class Itinerario < ActiveRecord::Base
  belongs_to :estagiario
  belongs_to :unidade
end
