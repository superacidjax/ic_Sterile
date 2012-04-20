class AddAvailabilityToClients < ActiveRecord::Migration
  def self.up
    %w(mon tue wed thu fri sat sun).each do |day|
      add_column :clients, "#{day}_begin", :integer
      add_column :clients, "#{day}_end", :integer
    end
  end

  def self.down
    %w(mon tue wed thu fri sat sun).each do |day|
      remove_column :clients, "#{day}_begin"
      remove_column :clients, "#{day}_end"
    end
  end
end
