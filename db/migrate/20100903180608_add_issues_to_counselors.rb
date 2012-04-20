class AddIssuesToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :issues, :string, :limit => 512
  end

  def self.down
    remove_column :counselors, :issues
  end
end
