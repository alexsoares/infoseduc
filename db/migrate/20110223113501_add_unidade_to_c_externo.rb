class AddUnidadeToCExterno < ActiveRecord::Migration
  def self.up
    add_column :c_externos, :unidade, :integer
  end

  def self.down
    remove_column :c_externos, :unidade
  end
end
