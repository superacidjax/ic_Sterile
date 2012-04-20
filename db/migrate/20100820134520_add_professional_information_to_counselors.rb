class AddProfessionalInformationToCounselors < ActiveRecord::Migration
  def self.up
    add_column :counselors, :birthday, :date
    add_column :counselors, :gender, :string
    add_column :counselors, :undergraduate_university, :string
    add_column :counselors, :undergraduate_degree, :string
    add_column :counselors, :graduate_university, :string
    add_column :counselors, :graduate_degree, :string
    add_column :counselors, :additional_university, :string
    add_column :counselors, :additional_degree, :string
    add_column :counselors, :certifications, :string
  end

  def self.down
    remove_column :counselors, :additional_degree
    remove_column :counselors, :additional_university
    remove_column :counselors, :graduate_degree
    remove_column :counselors, :graduate_university
    remove_column :counselors, :undergraduate_degree
    remove_column :counselors, :undergraduate_university
    remove_column :counselors, :gender
    remove_column :counselors, :birthday
  end
end
