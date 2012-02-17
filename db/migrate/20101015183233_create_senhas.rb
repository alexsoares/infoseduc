class CreateSenhas < ActiveRecord::Migration
  def self.up
    create_table :senhas do |t|
      t.references :unidade, :null => false
      t.string :de
      t.string :usuario
      t.string :senha
      t.string :fone
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :senhas
  end
end
