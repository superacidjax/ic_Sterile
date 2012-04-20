class RemoveIssuesFromClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :issues
  end

  def self.down
    add_column :clients, :issues, :string
  end
end
