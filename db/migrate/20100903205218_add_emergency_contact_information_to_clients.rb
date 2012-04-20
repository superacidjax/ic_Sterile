class AddEmergencyContactInformationToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :emergency_contact_name, :string
    add_column :clients, :emergency_contact_phone_number, :string
    add_column :clients, :emergency_contact_relationship, :string
    add_column :clients, :emergency_contact_permitted, :boolean
  end

  def self.down
    remove_column :clients, :emergency_contact_permitted
    remove_column :clients, :emergency_contact_relationship
    remove_column :clients, :emergency_contact_phone_number
    remove_column :clients, :emergency_contact_name
  end
end
