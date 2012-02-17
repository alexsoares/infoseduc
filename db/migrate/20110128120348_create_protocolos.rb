class CreateProtocolos < ActiveRecord::Migration
  def self.up
    create_table :protocolos do |t|
      t.references :unidade
      t.string :problema
      t.references :estagiario
      t.datetime :data_sol
      t.string :solicitado
      t.string :atendente
      t.string :solicitacao
      t.string :protocolo
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :protocolos
  end
end
