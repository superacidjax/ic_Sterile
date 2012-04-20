class RemoveIssuesFromCounselors < ActiveRecord::Migration
  def self.up
    remove_column :counselors, :issues
  end

  def self.down
    add_column :counselors, :issues, :string
  end
end
