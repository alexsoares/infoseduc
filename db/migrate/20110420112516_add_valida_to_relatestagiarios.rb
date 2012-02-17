class AddValidaToRelatestagiarios < ActiveRecord::Migration
  def self.up
    add_column :relatestagiarios, :validacao, :boolean, :default => false
  end

  def self.down
    remove_column :relatestagiarios, :validacao
  end
end
