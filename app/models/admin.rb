class Admin < ActiveRecord::Base
  include User

  validates_presence_of :first_name, :last_name, :time_zone
end
