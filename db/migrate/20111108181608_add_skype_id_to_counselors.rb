class AddSkypeIdToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :skype_id, :string
  end

  def self.down
    remove_column :counselors, :skype_id
  end
end
