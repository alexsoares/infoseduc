class CreateTipoOsexternas < ActiveRecord::Migration
  def self.up
    create_table :tipo_osexternas do |t|
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_osexternas
  end
end
