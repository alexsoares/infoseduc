class AddIpToUnidades < ActiveRecord::Migration
  def self.up
    add_column :unidades, :ip, :string
  end

  def self.down
    remove_column :unidades, :ip
  end
end
