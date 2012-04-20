class AddCounselorBioToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :counselor_bio, :text
    
  end

  def self.down
    remove_column :counselors, :counselor_bio
  end
end
