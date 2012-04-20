class AddReligionsToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :religions, :string
  end

  def self.down
    remove_column :counselors, :religions
  end
end
