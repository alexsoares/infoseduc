class CreateItinerarios < ActiveRecord::Migration
  def self.up
    create_table :itinerarios do |t|
      t.references :estagiario
      t.references :unidade
      t.date :data_visita
      t.string :obs
      
      t.timestamps
    end
  end

  def self.down
    drop_table :itinerarios
  end
end
