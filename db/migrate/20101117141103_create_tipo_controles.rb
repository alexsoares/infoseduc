class CreateTipoControles < ActiveRecord::Migration
  def self.up
    create_table :tipo_controles do |t|
      t.string :nome

      t.timestamps
    end

    TipoControle.create :nome => 'ADMINITRAÇÃO'
    TipoControle.create :nome => 'LABORATÓRIO'
    TipoControle.create :nome => 'TERCEIROS'


  end

  def self.down
    drop_table :tipo_controles
  end
end
