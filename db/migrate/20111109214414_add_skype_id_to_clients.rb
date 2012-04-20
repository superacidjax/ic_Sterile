class AddSkypeIdToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :skype_id, :string
  end

  def self.down
    remove_column :clients, :skype_id
  end
end
