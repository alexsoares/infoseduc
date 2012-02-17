class AddHoraSaidaToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :hora_saida, :datetime
  end

  def self.down
    remove_column :justificativas, :hora_saida
  end
end
