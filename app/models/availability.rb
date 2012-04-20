module Availability

  DAYS = %w(mon tue wed thu fri sat sun)
  extend ActiveSupport::Concern

  included do
    DAYS.each do |day|
      validates_presence_of "#{day}_begin", if: "#{day}_end?"
      validates_presence_of "#{day}_end", if: "#{day}_begin?"
    end
    validates_each *DAYS.map {|d| "#{d}_end"} do |record, attr, last|
      first = record.send(attr.sub(/_end$/, '_begin'))
      if first && last && first > last
        record.errors.add attr, :invalid
      end
    end
  end

  DAYS.each do |day|
    define_method("#{day}_begin?") { send("#{day}_begin").present? }
    define_method("#{day}_end?") { send("#{day}_end").present? }
  end

  def availability_error?(day = nil)
    if day
      errors["#{day}_begin"].any? || errors["#{day}_end"].any?
    else
      DAYS.any? { |d| availability_error?(d) }
    end
  end

  def day_begin(day)
    send("#{day}_begin")
  end

  def day_end(day)
    send("#{day}_end")
  end

end
