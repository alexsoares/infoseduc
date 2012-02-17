class CreateImpressoras < ActiveRecord::Migration
  def self.up
    create_table :impressoras do |t|
      t.references :unidade
      t.references :tipo_controle
      t.integer :quant
      t.string :config
      t.string :pat
      t.string :user
      t.string :pertence
      t.string :contato

      t.timestamps
    end
  end

  def self.down
    drop_table :impressoras
  end
end
