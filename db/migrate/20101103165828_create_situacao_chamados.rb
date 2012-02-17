class CreateSituacaoChamados < ActiveRecord::Migration
  def self.up
    create_table :situacao_chamados do |t|
      t.string :situacao

      t.timestamps
    end

    SituacaoChamado.create :situacao => 'EM ABERTO'
    SituacaoChamado.create :situacao => 'ENCERRADO'
    SituacaoChamado.create :situacao => 'AGUARDANDO COMPRAS'
    SituacaoChamado.create :situacao => 'AGUARDANDO MOTORISTA'
    SituacaoChamado.create :situacao => 'SERVIÇO DE TERCEIROS'
    
  end

  def self.down
    drop_table :situacao_chamados
  end
end
