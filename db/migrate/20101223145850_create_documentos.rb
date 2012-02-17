class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.string :titulo
      t.text :descricao
      t.references :c_externo

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end
