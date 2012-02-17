class AddQtdHrsToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :qtd_hrs, :integer
  end

  def self.down
    remove_column :justificativas, :qtd_hrs
  end
end
