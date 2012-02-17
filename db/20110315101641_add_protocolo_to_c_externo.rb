class AddProtocoloToCExterno < ActiveRecord::Migration
  def self.up
    add_column :c_externos, :protocolo, :integer
  end

  def self.down
    remove_column :c_externos, :protocolo
  end
end
