class AddLicenseTypeToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :license_type, :string
  end

  def self.down
    remove_column :counselors, :license_type
  end
end
