module AvailabilityHelper
  HOURS = %w(
    12AM 1AM 2AM 3AM 4AM 5AM 6AM 7AM 8AM 9AM 10AM 11AM
    12PM 1PM 2PM 3PM 4PM 5PM 6PM 7PM 8PM 9PM 10PM 11PM
  )

  def hour_options
    HOURS.zip(0..23)
  end

  def display_hour(hour_int)
    Time.now.change(hour: hour_int).to_s(:time_only)
  end

  def availability_on_day(user, day)
    if day_begin = user.day_begin(day)
      [day_begin, content_tag(:span, 'to'), user.day_end(day)].join(' ')
    else
      content_tag(:span, 'N/A')
    end.html_safe
  end

end
