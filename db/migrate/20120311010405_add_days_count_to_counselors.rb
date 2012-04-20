class AddDaysCountToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :days_count, :integer, default: 0, null: false
    Counselor.find_each(batch_size: 25) do |c|
      Counselor.reset_counters(c.id, :days)
    end
  end

  def self.down
    remove_column :counselors, :days_count
  end
end
