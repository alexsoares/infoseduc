class CreatePontos < ActiveRecord::Migration
  def self.up
    create_table :pontos do |t|
      t.references :estagiario
      t.timestamp :entrada
      t.timestamp :saida
      t.integer :total_trabalhado

      t.timestamps
    end
  end

  def self.down
    drop_table :pontos
  end
end
