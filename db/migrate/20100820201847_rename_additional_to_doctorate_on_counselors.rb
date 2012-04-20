class RenameAdditionalToDoctorateOnCounselors < ActiveRecord::Migration
  def self.up
    rename_column :counselors, :additional_university, :doctoral_university
    rename_column :counselors, :additional_degree, :doctoral_degree
  end

  def self.down
    rename_column :counselors, :doctoral_degree, :additional_degree
    rename_column :counselors, :doctoral_university, :additional_university
  end
end
