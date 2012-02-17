class Departamento < ActiveRecord::Base

belongs_to :unidade
has_many :emprestimos

validates_presence_of :depto, :message => ' - TIPO UNIDADE EM BRANCO - '

def before_save
    self.depto.upcase!
end

end
