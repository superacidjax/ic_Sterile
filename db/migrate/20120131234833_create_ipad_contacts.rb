class CreateIpadContacts < ActiveRecord::Migration
  def self.up
    create_table :ipad_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :zip_code
      t.string :email
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :ipad_contacts
  end
end
