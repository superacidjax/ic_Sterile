class AddNotesToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :notes, :text
  end

  def self.down
    remove_column :counselors, :notes
  end
end
