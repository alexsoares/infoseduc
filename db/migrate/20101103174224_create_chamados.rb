class CreateChamados < ActiveRecord::Migration
  def self.up
    create_table :chamados do |t|
      t.datetime :data_sol
      t.string :solicitante
      t.references :unidade
      t.string :depto
      t.string :forma_sol
      t.string :problema
      t.datetime :data_aten
      t.references :estagiario
      t.references :tipos_problema
      t.integer :patrimonio
      t.string :local
      t.string :procedimentos
      t.references :situacao_chamado, :default => 1
      t.datetime :data_enc
      t.string :local
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :chamados
  end
end
