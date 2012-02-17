class AddCumpriuHorarioToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :cumpriu_horario, :boolean
  end

  def self.down
    remove_column :justificativas, :cumpriu_horario
  end
end
