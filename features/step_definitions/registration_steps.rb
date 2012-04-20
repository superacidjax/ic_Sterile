Given 'I have finished step 1 of counselor registration' do
  step 'I am on the homepage'
  step 'I follow "For Counselors"'
  step 'I follow "Sign up now!"'
  step 'I fill out step 1 of counselor registration'
  step 'I press "Continue Registration"'
  @counselor = Counselor.last
end

When 'I fill out step 1 of counselor registration' do
  step 'I fill in "First name" with "Ramona"'
  step 'I fill in "Last name" with "Flowers"'
  step 'I select "Canada" from "Country"'
  step 'I fill in "Phone number" with "212 664 7665"'
  step 'I fill in "Skype ID" with "my_skype_id"'
  step 'I fill in "City" with "Toronto"'
  step 'I fill in "State/Province" with "Ontario"'
  step 'I fill in "Zip/Postal" with "M4B 1B3"'
  step 'I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone"'
  step 'I fill in "Email" with "ramona@example.com"'
  step 'I fill in "Password" with "password"'
  step 'I fill in "Password confirmation" with "password"'
  step 'I check "I agree"'
end

Given 'I have finished step 2 of counselor registration' do
  step 'I have finished step 1 of counselor registration'
  step %(I choose "Male")
  step %(I choose "No" in the "Are you currently licensed?" section)
  step %(I choose "No" in the "Has your license ever been suspended" section)
  step %(I press "Continue Registration")
end

Given 'I have finished step 1 of client registration' do
  step 'I am on the homepage'
  step 'I follow "Get started now!"'
  step 'I fill in "First name" with "Stephen"'
  step 'I fill in "Last name" with "Stills"'
  step 'I select "Canada" from "Country"'
  step 'I fill in "City" with "Toronto"'
  step 'I fill in "State/Province" with "Ontario"'
  step 'I fill in "Zip/Postal" with "M4B 1B3"'
  step 'I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone"'
  step 'I fill in "Email" with "stephen@example.com"'
  step 'I fill in "Password" with "password"'
  step 'I fill in "Password confirmation" with "password"'
  step 'I check "I agree"'
  step 'I press "Finished"'
  step 'I follow "fill out your account settings"'
  step 'I should see "Personal Information"'
end

Given 'I have finished step 2 of client registration' do
  step 'I have finished step 1 of client registration'
  step 'I choose "Male"'
  step 'I choose "Single"'
  step 'I choose "Full-time"'
  step 'I choose "Some college"'
  step 'I press "Save and Continue"'
  step 'I should see "Emergency Contact"'
end

When 'I register as a counselor' do
  step %(I register as a counselor named "Ramona Flowers")
end

When /^I register as a counselor named "(.*)"$/ do |name|
  first, last = name.split(' ', 2)
  step %(I am on the homepage)
  step %(I follow "For Counselors")
  step %(I follow "Sign up now!")
  step %(I fill in "First name" with "#{first}")
  step %(I fill in "Last name" with "#{last}")
  step %(I select "Canada" from "Country")
  step %(I fill in "Phone number" with "212 664 7665")
  step %(I fill in "Skype ID" with "my_skype_id")
  step %(I fill in "City" with "Toronto")
  step %(I fill in "State/Province" with "Ontario")
  step %(I fill in "Zip/Postal" with "M4B 1B3")
  step %(I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone")
  step %(I fill in "Email" with "#{first.downcase}@example.com")
  step %(I fill in "Password" with "password")
  step %(I fill in "Password confirmation" with "password")
  step %(I check "I agree")
  step %(I press "Continue Registration")
  step %(I choose "Male")
  step %(I choose "No" in the "Are you currently licensed?" section)
  step %(I choose "No" in the "Has your license ever been suspended" section)
  step %(I press "Continue Registration")
  step %(I press "Finish Registration")
end
