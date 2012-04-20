class SimplifyLicenseOnCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :licensed, :boolean
    remove_column :counselors, :license_type
    remove_column :counselors, :licensing_state

    add_column :counselors, :license_suspended, :boolean
    remove_column :counselors, :license_suspension
  end

  def self.down
    add_column :counselors, :license_suspension, :string
    remove_column :counselors, :license_suspended

    add_column :counselors, :licensing_state, :string
    add_column :counselors, :license_type, :string
    remove_column :counselors, :licensed
  end
end
