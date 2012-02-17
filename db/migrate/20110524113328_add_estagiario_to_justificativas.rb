class AddEstagiarioToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :estagiario_id, :integer
  end

  def self.down
    remove_column :justificativas, :estagiario_id
  end
end
