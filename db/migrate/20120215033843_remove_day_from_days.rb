class RemoveDayFromDays < ActiveRecord::Migration
  def self.up
    remove_column :days, :day
  end

  def self.down
    add_column :days, :day, :string
  end
end
