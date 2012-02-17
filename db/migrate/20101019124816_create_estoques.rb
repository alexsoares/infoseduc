class CreateEstoques < ActiveRecord::Migration
  def self.up
    create_table :estoques do |t|
      t.references :componente, :null => false
      t.string :especifica
      t.integer :saldo, :default => 0
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :estoques
  end
end
