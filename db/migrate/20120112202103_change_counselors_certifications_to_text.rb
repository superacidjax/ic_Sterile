class ChangeCounselorsCertificationsToText < ActiveRecord::Migration
  def self.up
    change_column :counselors, :certifications, :text
  end

  def self.down
    change_column :counselors, :certifications, :string
  end
end
