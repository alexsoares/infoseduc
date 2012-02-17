class CreateEmfaltas < ActiveRecord::Migration
  def self.up
    create_table :emfaltas do |t|
      t.references :componente
      t.string :especifica
      t.integer :quant
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :emfaltas
  end
end
