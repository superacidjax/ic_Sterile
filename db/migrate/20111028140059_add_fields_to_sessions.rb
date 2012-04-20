class AddFieldsToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :start_datetime, :datetime
    add_column :sessions, :end_datetime, :datetime
    remove_column :sessions, :transaction_id
  end

  def self.down
    add_column :sessions, :transaction_id, :string
    remove_column :sessions, :end_datetime
    remove_column :sessions, :start_datetime
  end
end
