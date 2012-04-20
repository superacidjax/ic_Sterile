class AddEmployerIdNumberToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :employer_id_number, :string
  end

  def self.down
    remove_column :counselors, :employer_id_number
  end
end
