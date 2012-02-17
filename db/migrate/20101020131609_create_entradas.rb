class CreateEntradas < ActiveRecord::Migration
  def self.up
    create_table :entradas do |t|
      t.references :componente
      t.references :estoque
      t.integer :quantidade
      t.datetime :data_ent
      t.string :procedencia
      t.string :NF
      t.string:obs

      t.timestamps
    end
  end

  def self.down
    drop_table :entradas
  end
end
