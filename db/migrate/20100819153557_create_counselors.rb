class CreateCounselors < ActiveRecord::Migration
  def self.up
    create_table :counselors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :time_zone
      t.string :city
      t.string :state_or_province
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :counselors
  end
end
