class CreateRelatorios < ActiveRecord::Migration
  def self.up
    create_table :relatorios do |t|
      t.references :unidade
      t.references :estagiario
      t.string :responsavel
      t.datetime :data
      t.string :problema
      t.string :procedimentos
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :relatorios
  end
end
