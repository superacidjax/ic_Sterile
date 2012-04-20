class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.integer :counselor_id
      t.string :day
      t.text :available_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
