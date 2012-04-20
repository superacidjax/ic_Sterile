class AddSessionCreditsToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :session_credits, :integer, :default => 0
  end

  def self.down
    remove_column :clients, :session_credits
  end
end
