class CreateAdministracaos < ActiveRecord::Migration
  def self.up
    create_table :administracaos do |t|
      t.references :unidade, :null => false
      t.references :tipo_controle
      t.string :servidor
      t.string :rede
      t.string :internet
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :administracaos
  end
end
