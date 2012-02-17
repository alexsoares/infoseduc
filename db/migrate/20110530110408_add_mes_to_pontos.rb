class AddMesToPontos < ActiveRecord::Migration
  def self.up
    add_column :pontos, :mes, :integer
  end

  def self.down
    remove_column :pontos, :mes
  end
end
