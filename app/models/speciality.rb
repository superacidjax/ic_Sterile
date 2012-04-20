class Speciality < ActiveRecord::Base
  belongs_to :counselor
  belongs_to :issue
end
