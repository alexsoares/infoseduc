class CreateSaidas < ActiveRecord::Migration
  def self.up
    create_table :saidas do |t|
      t.references :componente
      t.references :estoque
      t.references :estagiario
      t.references :unidade
      t.integer :quantidade
      t.datetime :data_saida
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :saidas
  end
end
