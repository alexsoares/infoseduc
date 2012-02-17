class CreateEquipamentos < ActiveRecord::Migration
  def self.up
    create_table :equipamentos do |t|
      t.string :equipamento
      t.string :pat
      t.string :configuracao
      t.references :unidade
      t.datetime :dataent
      t.string :estado
      t.string :providencia
      t.string :procedimento
      t.string :instalacao
      t.datetime :dataexec
      t.string :destinacao
      t.string :trouxe
      t.references :estagiario
      t.datetime :datasaida
      t.integer :os
      t.integer :encerrado, :default => 0
      t.string :obs
     

      t.timestamps
    end
  end

  def self.down
    drop_table :equipamentos
  end
end
