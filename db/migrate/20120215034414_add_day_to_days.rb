class AddDayToDays < ActiveRecord::Migration
  def self.up
    add_column :days, :day, :date
  end

  def self.down
    remove_column :days, :day
  end
end
