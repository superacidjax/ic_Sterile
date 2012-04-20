class AddAvatarToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :avatar, :string
  end

  def self.down
    remove_column :clients, :avatar
  end
end
