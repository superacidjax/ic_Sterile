Given /^I am signed in as the following (\w+):$/ do |role, table|
  step %(the following #{role}:), table
  @me = @it
  step 'I am signed in'
end

Given /^I (?:am signed|sign) in as an? (\w+)$/ do |role|
  @me = Fabricate(role.to_sym)
  step 'I am signed in'
end

Given 'I am signed in' do
  visit new_account_session_path
  fill_in "Email", :with => @me.email
  fill_in "Password", :with => @me.password
  click_button "Sign in"
end

When /^I sign in as "([^"]*)"$/ do |email|
  @me = Account.find_by_email(email)
  @me.password ||= 'password'
  step 'I am signed in'
end
