class Relatorio < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :estagiario
end
