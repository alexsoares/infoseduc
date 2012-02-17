class CreateMesBases < ActiveRecord::Migration
  def self.up
    create_table :mes_bases do |t|
      t.date :data
      t.integer :mes
      t.integer :qtde_dias
      t.timestamps
    end
  end

  def self.down
    drop_table :mes_bases
  end
end
