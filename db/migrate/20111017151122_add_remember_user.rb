class AddRememberUser < ActiveRecord::Migration
  def self.up
    add_column :users, :persistence_token, :string, :null=>false 

    add_index :users, :persistence_token, :name => "index_users_on_persistence_token", :unique => true
  end

  def self.down

    remove_index :users, :persistence_token
    remove_column :users, :persistence_token

  end
end
