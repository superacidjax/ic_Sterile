Given /^I am signed in as "([^"]*)"$/ do |email|
  @me = Account.find_by_email email
  step %(I go to the new account session page)
  step %(I fill in "Email" with "#{@me.email}")
  step %(I fill in "Password" with "password")
  step %(I press "Sign in")
end
