Fabricator(:admin) do
  email { "stacey.#{Time.now.to_f}@example.com" }
  password 'password'
  password_confirmation { |account| account.password }
  first_name 'Stacey'
  last_name 'Pilgrim'
  time_zone 'Eastern Time (US & Canada)'
end
