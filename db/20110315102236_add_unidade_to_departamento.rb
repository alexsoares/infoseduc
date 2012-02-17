class AddUnidadeToDepartamento < ActiveRecord::Migration
  def self.up
    add_column :departamentos, :unidade_id, :integer
  end

  def self.down
    remove_column :departamentos, :unidade_id
  end
end
