class AddUserToOnlineUsers < ActiveRecord::Migration
  def self.up
    add_column :online_users, :user_id, :integer
  end

  def self.down
    remove_column :online_users, :user_id
  end
end
