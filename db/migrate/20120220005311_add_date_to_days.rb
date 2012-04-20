class AddDateToDays < ActiveRecord::Migration
  def self.up
    add_column :days, :date, :date
  end

  def self.down
    remove_column :days, :date
  end
end
