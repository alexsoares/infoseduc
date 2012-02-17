class CreateOnlineUsers < ActiveRecord::Migration
  def self.up
    create_table :online_users do |t|
      t.string :username
      t.date :last_seen
      t.boolean :online

      t.timestamps
    end
  end

  def self.down
    drop_table :online_users
  end
end
