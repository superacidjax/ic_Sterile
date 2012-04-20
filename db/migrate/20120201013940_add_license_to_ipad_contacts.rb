class AddLicenseToIpadContacts < ActiveRecord::Migration
  def self.up
    add_column :ipad_contacts, :license, :boolean
  end

  def self.down
    remove_column :ipad_contacts, :license
  end
end
