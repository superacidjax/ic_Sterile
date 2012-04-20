sections = %w(nav h1 h2 h3 h4 h5 h6 legend caption dt strong p)

When /^I should see a "([^"]*)" button in the "([^"]*)" list$/ do |button_label, title|
  within_parent_preceding(title, sections) do
    page.should have_xpath(".//input[@type='submit'][contains(@value, '#{button_label}')]")
  end
end

When /^I should not see a "([^"]*)" button in the "([^"]*)" list$/ do |button_label, title|
  within_parent_preceding(title, sections) do
    page.should have_no_xpath(".//input[@type='submit'][contains(@value, '#{button_label}')]")
  end
end

When /^I press "([^"]*)" in the "([^"]*)" list$/ do |button_label, title|
  within_parent_preceding(title, sections) do
    page.find(:xpath, ".//input[@type='submit'][contains(@value, '#{button_label}')]").click
  end
end
