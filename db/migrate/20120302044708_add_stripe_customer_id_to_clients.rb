class AddStripeCustomerIdToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :stripe_customer_id, :string
  end

  def self.down
    remove_column :clients, :stripe_customer_id
  end
end
