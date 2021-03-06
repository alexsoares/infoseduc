class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table "roles" do |t|
      t.string :name
    end
    
    # generate the join table
    create_table "roles_users" do |t|
      t.integer "role_id", "user_id"
    end
    add_index "roles_users", "role_id"
    add_index "roles_users", "user_id"

    Role.create :name => "administrador"
    Role.create :name => "estagiario unidade"
    Role.create :name => "estagiario SEDUC"
    Role.create :name => "estagiario itinerante"
   
    RolesUser.create :role_id => 1, :user_id => 1

  end

  def self.down
    drop_table "roles"
    drop_table "roles_users"
  end
end