class AddRecessoToJustificativas < ActiveRecord::Migration
  def self.up
    add_column :justificativas, :recesso, :boolean
  end

  def self.down
    remove_column :justificativas, :recesso
  end
end
