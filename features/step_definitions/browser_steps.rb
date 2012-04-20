When 'my browser is closed and reopened' do
  cookie_jar = Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
    existing_cookie.name.downcase == '_icouch_session'
  end
end
