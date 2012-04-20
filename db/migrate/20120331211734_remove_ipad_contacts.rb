class RemoveIpadContacts < ActiveRecord::Migration
   def self.up
    drop_table :ipad_contacts
    end
  end

  def self.down
    create_table :ipad_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :zip_code
      t.string :email
      t.string :country
  end
end
