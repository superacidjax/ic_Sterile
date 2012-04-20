Fabricator(:client) do
  email { "julie.#{Time.now.to_f}@example.com" }
  password 'password'
  password_confirmation { |account| account.password }
  first_name 'Julie'
  last_name 'Powers'
  country 'CA'
  time_zone 'Eastern Time (US & Canada)'
  city 'Toronto'
  state_or_province 'Ontario'
  postal_code 'M4B 1B3'
  emergency_contact_name 'Bill Boggs'
  emergency_contact_phone_number '111-222-3333'
  emergency_contact_relationship 'Uncle'
  languages ["en", "es", "fr"]
  religions ["buddhism"]
  mon_begin 1
  mon_end 23
  wed_begin 12
  wed_end 23
  fri_begin 2
  fri_end 10
  gender "Female"
  relationship_status "single"
  education "high_school"
  employment_status "full_time"
  previously_counseled "true"
  currently_counseled "true"
end
