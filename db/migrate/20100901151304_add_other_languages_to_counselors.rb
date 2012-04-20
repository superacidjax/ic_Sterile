class AddOtherLanguagesToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :other_languages, :string
  end

  def self.down
    remove_column :counselors, :other_languages
  end
end
