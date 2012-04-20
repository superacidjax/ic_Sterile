class CreateConcerns < ActiveRecord::Migration
  def self.up
    create_table :concerns do |t|
      t.references :issue
      t.references :client

      t.timestamps
    end
  end

  def self.down
    drop_table :concerns
  end
end
