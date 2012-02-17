class AddChatSessionToOnlineUser < ActiveRecord::Migration
  def self.up
    add_column :online_users, :chat_session, :integer
  end

  def self.down
    remove_column :online_users, :chat_session
  end
end
