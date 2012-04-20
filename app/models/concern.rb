class Concern < ActiveRecord::Base
  belongs_to :issue
  belongs_to :client
end
