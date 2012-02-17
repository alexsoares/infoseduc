class CreateCExternos < ActiveRecord::Migration
  def self.up
    create_table :c_externos do |t|
      t.references :empresa
      t.references :unidade
      t.string :atendente
      t.datetime :data_hora
      t.integer :situacao, :default => 0
      t.datetime :data_encerra
      t.text :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :c_externos
  end
end
