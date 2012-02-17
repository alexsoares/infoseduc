class Protocolo < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :estagiario
end
