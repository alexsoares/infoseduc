class AddUnidadeToAnexo < ActiveRecord::Migration
  def self.up
    add_column :anexos, :unidade_id, :integer
  end

  def self.down
    remove_column :anexos, :unidade_id
  end
end
