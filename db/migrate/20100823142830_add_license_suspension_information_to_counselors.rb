class AddLicenseSuspensionInformationToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :license_suspension, :string
    add_column :counselors, :license_suspension_explanation, :text
    add_column :counselors, :license_suspension_authority, :string
    add_column :counselors, :license_suspension_date, :datetime
  end

  def self.down
    remove_column :counselors, :license_suspension_date
    remove_column :counselors, :license_suspension_authority
    remove_column :counselors, :license_suspension_explanation
    remove_column :counselors, :license_suspension
  end
end
