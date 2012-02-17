class CreateContatoInternos < ActiveRecord::Migration
  def self.up
    create_table :contato_internos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :contato_internos
  end
end
