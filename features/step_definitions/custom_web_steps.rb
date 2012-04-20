Then /^I should see an image named "([^"]*)"$/ do |name|
  page.should have_xpath("//img[contains(@src,'#{name}')]")
end
