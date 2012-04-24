class AddBibliotecaToUnidades < ActiveRecord::Migration
  def self.up
    add_column :unidades, :biblioteca, :string
  end

  def self.down
    remove_column :unidades, :biblioteca
  end
end
