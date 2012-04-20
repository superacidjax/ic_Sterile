class AddOtherSpecialtiesToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :other_specialties, :string
  end

  def self.down
    remove_column :counselors, :other_specialties
  end
end
