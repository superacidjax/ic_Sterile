class RenameOtherSpecialtiesToOtherIssuesOnCounselors < ActiveRecord::Migration
  def self.up
    rename_column :counselors, :other_specialties, :other_issues
  end

  def self.down
    rename_column :counselors, :other_issues, :other_specialties
  end
end
