Given 'that counselor has this avatar:' do |table|
  file = File.join(Rails.root, 'spec', 'data', table.rows_hash['file name'])
  @counselor.update_attribute(:avatar, File.new(file))
end

Given /^those counselors collectively specialize in those issues except "([^"]*)"$/ do |nobody_specializing|
  @issues.reject!{|issue| issue.name == nobody_specializing.downcase}
  @issues.each do |issue|
    @counselors[rand(2)].specialities.create(issue: issue)
  end
end
