module ApplicationHelper
  def active_if_matches(regexp)
    "active" if path_matches(regexp)
  end

  def path_matches(regexp)
    regexp =~ request.path
  end

  def yes_or_no(boolean)
    boolean ? "Yes" : "No"
  end

  def dummy_image(width, height, bg_color="cccccc", fg_color="333333")
    "http://dummyimage.com/#{width}x#{height}/#{bg_color}/#{fg_color}"
  end

  def pluralize_string_only(count, singular, plural=nil)
    ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
  end
end
