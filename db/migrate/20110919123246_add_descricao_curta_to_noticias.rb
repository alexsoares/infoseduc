class AddDescricaoCurtaToNoticias < ActiveRecord::Migration
  def self.up
    add_column :noticias, :descricao_curta, :string
  end

  def self.down
    remove_column :noticias, :descricao_curta
  end
end
