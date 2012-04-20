class DeviseCreateAccounts < ActiveRecord::Migration
  def self.up
    create_table(:accounts) do |t|
      t.database_authenticatable :null => false
      # t.encryptable
      t.string  :password_salt, :default => "", :null => false
      t.recoverable
      t.rememberable
      t.confirmable
      t.timestamps
    end

    add_index :accounts, :email,                :unique => true
    add_index :accounts, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
