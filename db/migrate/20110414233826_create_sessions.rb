class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.references :counselor
      t.references :client
      t.string :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
