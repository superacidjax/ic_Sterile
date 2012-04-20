class AddRoleToAccounts < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.references :role, :polymorphic => true
    end
  end

  def self.down
    change_table :accounts do |t|
      t.remove_references :role, :polymorphic => true
    end
  end
end
