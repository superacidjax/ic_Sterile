class AddCounselingHistoryToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :previously_counseled, :boolean
    add_column :clients, :currently_counseled, :boolean
  end

  def self.down
    remove_column :clients, :currently_counseled
    remove_column :clients, :previously_counseled
  end
end
