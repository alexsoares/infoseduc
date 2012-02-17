class CreateChatsUsers < ActiveRecord::Migration
  def self.up
    create_table :chats_users, :id => false do |t|
      t.references :chat, :null => false
      t.references :user, :null => false
    end
  end

  def self.down
    drop_table :chats_users
  end
end
