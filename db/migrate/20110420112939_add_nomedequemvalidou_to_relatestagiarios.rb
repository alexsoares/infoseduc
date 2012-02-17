class AddNomedequemvalidouToRelatestagiarios < ActiveRecord::Migration
  def self.up
    add_column :relatestagiarios, :nome, :string
  end

  def self.down
    remove_column :relatestagiarios, :nome
  end
end
