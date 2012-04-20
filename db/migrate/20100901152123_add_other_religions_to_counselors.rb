class AddOtherReligionsToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :other_religions, :string
  end

  def self.down
    remove_column :counselors, :other_religions
  end
end
