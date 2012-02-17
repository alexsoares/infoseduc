class CreateInformativos < ActiveRecord::Migration
  def self.up
    create_table :informativos do |t|
      t.text :mensagem
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end

  def self.down
    drop_table :informativos
  end
end
