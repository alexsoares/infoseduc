class Emprestimo < ActiveRecord::Base
  validates_presence_of :departamento_id,:unidade_id
  belongs_to :unidade
  belongs_to :departamento
end
