class AddPersonalInformationToClients < ActiveRecord::Migration
  class Client < ActiveRecord::Base
  end
  def self.up
    unless Client.columns_hash['birthday']
      change_table :clients do |t|
        t.date :birthday
        t.string :gender
        t.string :relationship_status
        t.string :employment_status
        t.string :education
      end
    end
    execute "delete from schema_migrations where version = '2010082420379'"
  end

  def self.down
    change_table :clients do |t|
      t.remove :birthday
      t.remove :gender
      t.remove :relationship_status
      t.remove :employment_status
      t.remove :education
    end
  end
end
