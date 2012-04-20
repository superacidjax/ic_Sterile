class AddSessionPreferencesToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :other_issues, :string
    add_column :clients, :other_languages, :string
    add_column :clients, :other_religions, :string
    add_column :clients, :issues, :string, :limit => 512
    add_column :clients, :languages, :string
    add_column :clients, :religions, :string
  end

  def self.down
    remove_column :clients, :religions
    remove_column :clients, :languages
    remove_column :clients, :issues
    remove_column :clients, :other_religions
    remove_column :clients, :other_languages
    remove_column :clients, :other_issues
  end
end
