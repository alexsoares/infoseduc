class SituacaoChamado < ActiveRecord::Base

  has_many :chamados

def before_save
    self.situacao.upcase!
end

end
