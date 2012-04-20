class AddAvatarToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :avatar, :string
  end

  def self.down
    remove_column :counselors, :avatar
  end
end
