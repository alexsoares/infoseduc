class CreateEstagiarios < ActiveRecord::Migration
  def self.up
    create_table :estagiarios do |t|
      t.references :unidade
      t.references :regiao
      t.string :nome
      t.string :RG
      t.string :CPF
      t.string :endereco
      t.integer :num
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :fone
      t.string :cel
      t.string :email
      t.datetime :data_nasc
      t.string :faculdade
      t.string :matricula
      t.string :periodo_est
      t.string :responsavel
      t.datetime :data_ingresso
      t.datetime :data_termino
      t.datetime :data_admissao
      t.datetime :data_desliga
      t.string :locacao
      t.string :periodo_trab
      t.string :aval
      t.string :obs
      t.integer :flag, :default => 0
      t.integer :desligado, :default => 0
      t.integer :etinerante, :default => 0

      t.timestamps
    end


    
  end

  def self.down
    drop_table :estagiarios
  end
end
