class AddEmailToChamado < ActiveRecord::Migration
  def self.up
    add_column :chamados, :email, :string
  end

  def self.down
    remove_column :chamados, :email
  end
end
