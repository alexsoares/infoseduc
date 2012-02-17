class AddFimsemanaToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :fimsemana, :boolean
  end

  def self.down
    remove_column :justificativas, :fimsemana
  end
end
