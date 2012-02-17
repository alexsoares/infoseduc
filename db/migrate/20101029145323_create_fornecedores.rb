class CreateFornecedores < ActiveRecord::Migration
  def self.up
    create_table :fornecedores do |t|
      t.string :nome
      t.string :endereco
      t.integer :num
      t.string :complemento
      t.string :cidade
      t.string :fone
      t.string :cel
      t.string :email
      t.string :contato
      t.string :tipo_servico
      t.string :aval
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :fornecedores
  end
end
