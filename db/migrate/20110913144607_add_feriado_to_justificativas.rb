class AddFeriadoToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :feriado, :boolean
  end

  def self.down
    remove_column :justificativas, :feriado
  end
end
