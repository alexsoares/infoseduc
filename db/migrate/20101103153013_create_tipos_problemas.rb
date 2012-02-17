class CreateTiposProblemas < ActiveRecord::Migration
  def self.up
    create_table :tipos_problemas do |t|
      t.string :tipo

      t.timestamps
    end

    TiposProblema.create :tipo => 'NÂO DEFINIDO'
    TiposProblema.create :tipo => 'HARDWARE'
    TiposProblema.create :tipo => 'SOFTWARE'
    TiposProblema.create :tipo => 'S.O'
    TiposProblema.create :tipo => 'REDE'
    TiposProblema.create :tipo => 'SERVIDOR'
    TiposProblema.create :tipo => 'USUÁRIO'
    TiposProblema.create :tipo => 'CONEXÃO INTERNET'
    TiposProblema.create :tipo => 'OUTROS'

  end

  def self.down
    drop_table :tipos_problemas
  end
end
