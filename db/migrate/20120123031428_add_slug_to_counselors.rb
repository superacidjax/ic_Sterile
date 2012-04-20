class AddSlugToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :slug, :string
    add_index :counselors, :slug, unique: true
  end

  def self.down
    remove_column :counselors, :slug
  end
end
