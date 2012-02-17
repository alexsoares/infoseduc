class CreateRelatestagiarios < ActiveRecord::Migration
  def self.up
    create_table :relatestagiarios do |t|
      t.references :estagiario
      t.references :unidade
      t.datetime :datahora
      t.string :periodo
      t.string :responsavel
      t.string :ocorrencia
      t.string :providencia
      t.string :obs
      t.integer :valida, :default => 0
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :relatestagiarios
  end
end
