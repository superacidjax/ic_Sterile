module CounselorHelper

  def display_counselor_availability_list_next_week
    content_tag(:ul, counselor_availability_items_next_week)
  end

  def display_counselor_availability_list_this_week
    content_tag(:ul, counselor_availability_items_this_week)
  end

  def week_dates(date)
    date = date.at_beginning_of_week
    (0..6).map {|i| date + i.days}
  end

  def counselor_availability_items_this_week
    "".tap do |items|
      week_dates(Date.today).each do |day|
        items << content_tag(:li, content_for_availability_item(week, day), class: "#{day.strftime("%e")}#{' not_available' unless counselor.available_on?(day)}")
      end
    end.html_safe
  end

  def counselor_availability_items_next_week
    "".tap do |items|
      week_dates(Date.today + 7.days).each do |day|
        items << content_tag(:li, content_for_availability_item(next_week, day), class: "#{day.strftime("%e")}#{' not_available' unless counselor.available_on?(day)}")
      end
    end.html_safe
  end

  def content_for_availability_item(week, day)
    "".tap do |item|
      item << content_tag(:header, content_for_availability_header(week, day))
      item << content_tag(:ul, content_for_hours_list(week, day))
    end.html_safe
  end

  def content_for_hours_list(week, day)
    "".tap do |hour_items|
      if counselor.available_on?(day)
        counselor.hours_list(day).each do |hour|
          hour_items << content_tag(:li, book_tag_for(day, hour))
        end
      end
    end.html_safe
  end

  def content_for_availability_header(week, day)
    content_tag(:h5, day.strftime("%a, %b %d")) +
    content_tag(:strong, counselor.session_slots(day)).html_safe +
    " available"
  end

  def book_tag_for(day, hour)
    if counselor.session_booked_on?(actual_date_for(day, hour))
      link_to "Booked", "#", class: "button booked"
    else
      render partial: 'counseling_sessions/form', locals: {day: day, hour:hour}
    end
  end

  def label_for(date)
    date.strftime("%l:%M %p")
  end

  def written_out(date)
    "#{date.strftime('%b')} #{date.strftime('%d').to_i.to_s}, #{date.strftime('%Y')}"
  end

  def actual_date_for(day, hour)
    (day.beginning_of_day + hour.hours)
  end

  def new_session(date)
    if current_user.is_a?(Guest)
      CounselingSession.new(counselor: counselor, start_datetime: date)
    else
      current_user.counseling_sessions.new(counselor: counselor, start_datetime: date)
    end
  end

  def display_next_week
    date = Time.now.beginning_of_week + 1.week
    "#{written_out(date)} - #{written_out(date + 6.days)}"
  end

  def display_hour(time)
    time.strftime('%I').to_i.to_s
  end

  def display_appointment_time(hour)
    time1 = Time.now.beginning_of_day + hour.hours
    time2 = time1 + 1.hour
    "#{display_hour(time1)}#{time1.strftime('%P')[0..-2] if [11,23].include?(hour)}-#{display_hour(time2)}#{time2.strftime('%P')[0..-2]}"
  end
end
