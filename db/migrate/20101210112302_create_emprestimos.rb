class CreateEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :emprestimos do |t|
      t.references :unidade
      t.datetime :emprestimo
      t.datetime :devolucao
      t.string :responsavel
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :emprestimos
  end
end
