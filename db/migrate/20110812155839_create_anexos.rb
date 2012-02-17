class CreateAnexos < ActiveRecord::Migration
  def self.up
    create_table :anexos do |t|
      t.string :titulo
      t.text :descricao
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :anexos
  end
end
