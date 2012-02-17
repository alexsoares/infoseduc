class AddAnoToPontos < ActiveRecord::Migration
  def self.up
    add_column :pontos, :ano, :integer
  end

  def self.down
    remove_column :pontos, :ano
  end
end
