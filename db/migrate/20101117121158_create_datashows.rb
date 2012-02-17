class CreateDatashows < ActiveRecord::Migration
  def self.up
    create_table :datashows do |t|
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
    drop_table :datashows
  end
end
