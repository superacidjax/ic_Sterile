class ChangeParamsToTextOnPaymentNotifications < ActiveRecord::Migration
  def self.up
    change_column :payment_notifications, :params, :text
  end

  def self.down
    change_column :payment_notifications, :params, :string
  end
end
