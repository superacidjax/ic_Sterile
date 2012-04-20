class ChangeLicenseSuspensionDateToDateOnCounselors < ActiveRecord::Migration
  def self.up
    change_column :counselors, :license_suspension_date, :date
  end

  def self.down
    change_column :counselors, :license_suspension_date, :datetime
  end
end
