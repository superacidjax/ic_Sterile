module TemporalHelpers

  # Travels to +time+ and lets the clock keep running.
  #
  # If a block is given, executes the block at that
  # time then returns to the present.
  def travel_to(time, &block)
    Timecop.travel(to_eastern_time(time), &block)
  end

  # Travels to and freezes the clock at +time+.
  #
  # If a block is given, executes the block at that
  # time then returns to the present.
  def freeze_time_at(time, &block)
    Timecop.freeze( to_eastern_time(time), &block)
  end

  private
  def to_eastern_time time
    orig_zone = Time.parse(time).zone
    eastern_zone = if orig_zone =~ /DT$/
      'EDT'
    else
      'EST'
    end

    Time.parse "#{time} #{eastern_zone}"
  end
end

World(TemporalHelpers)

Given /^it is currently (.+)$/ do |time|
  travel_to time
end

Given /^time is frozen at (.+)$/ do |time|
  freeze_time_at time
end

Given /^(?:I|we) jump in our Delorean and return to the present$/ do
  Timecop.return
end

After do
  Timecop.return
end
