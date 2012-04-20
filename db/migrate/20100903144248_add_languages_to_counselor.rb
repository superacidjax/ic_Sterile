class AddLanguagesToCounselor < ActiveRecord::Migration
  def self.up
    add_column :counselors, :languages, :string
  end

  def self.down
    remove_column :counselors, :languages
  end
end
