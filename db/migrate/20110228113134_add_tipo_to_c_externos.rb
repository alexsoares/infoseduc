class AddTipoToCExternos < ActiveRecord::Migration
  def self.up
    add_column :c_externos, :tipo, :integer
  end

  def self.down
    remove_column :c_externos, :tipo
  end
end
