class MoveStatusToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :status, :string
    remove_column :accounts, :status
  end

  def self.down
    remove_column :counselors, :status
    add_column :accounts, :status, :string
  end
end
