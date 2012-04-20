Given /^I have a session with "([^"]*)"$/ do |name|
  if @me.kind_of? Counselor
    client = Client.find_by_first_name_and_last_name(*name.split(" "))
    @me.counseling_sessions.create(client: client)
  else
    counselor = Counselor.find_by_first_name_and_last_name(*name.split(" "))
    @me.counseling_sessions.create(counselor: counselor)
  end
end

Given /^I have a session with "([^"]*)" on "([^"]*)" at (\d+) hours$/ do |name, day, hour|
  session_start = Date.parse(day).to_time.utc.beginning_of_day.change(hour: hour)
  if @me.kind_of? Counselor
    client = Fabricate(:client, first_name: name.split[0], last_name: name.split[1])
    @me.counseling_sessions.create(client: client, start_datetime: session_start, end_datetime: (session_start + 1.hour))
  else
    counselor = Fabricate(:counselor, first_name: name.split[0], last_name: name.split[1])
    @me.counseling_sessions.create(counselor: counselor, start_datetime: session_start, end_datetime: (session_start + 1.hour))
  end
end
