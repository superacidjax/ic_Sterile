class CreatePaymentNotifications < ActiveRecord::Migration
  def self.up
    create_table :payment_notifications do |t|
      t.integer :client_id
      t.string :params
      t.string :token
      t.string :status, default: "pending"

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_notifications
  end
end
