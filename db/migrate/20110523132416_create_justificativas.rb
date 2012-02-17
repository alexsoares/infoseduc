class CreateJustificativas < ActiveRecord::Migration
  def self.up
    create_table :justificativas do |t|
      t.references :ponto
      t.text :justificativa
      t.boolean :entrada, :default => 0
      t.boolean :saida, :default => 0
      t.date :dia

      t.timestamps
    end
  end

  def self.down
    drop_table :justificativas
  end
end
