class Day < ActiveRecord::Base
  serialize :available_hours

  attr_accessor :hours

  belongs_to :counselor, counter_cache: true

  validates :counselor_id, presence: true

  before_save :aggregate_hours

  def aggregate_hours
    if hours
      self.available_hours = hours.select{|k,v| v.to_s == "1"}.keys.map{|k| k.to_s.gsub("hour_", "").to_i}
    end
  end
end
