class AddLicensingToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :license_number, :string
    add_column :counselors, :licensing_state, :string
    add_column :counselors, :licensing_authority, :string
  end

  def self.down
    remove_column :counselors, :licensing_authority
    remove_column :counselors, :licensing_state
    remove_column :counselors, :license_number
  end
end
