class AddPriceCentsAndCurrencyToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :cents, :integer, default: 9000, null: false
    add_column :counselors, :currency, :string, default: "USD", null: false
  end

  def self.down
    remove_column :counselors, :currency
    remove_column :counselors, :cents
  end
end
