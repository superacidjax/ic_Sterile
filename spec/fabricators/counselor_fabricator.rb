Fabricator(:counselor) do
  email { "ramona.#{Time.now.to_f}@example.com" }
  password 'password'
  password_confirmation { |account| account.password }
  first_name 'Ramona'
  last_name 'Flowers'
  gender 'Female'
  birthday 25.years.ago
  licensed true
  license_suspended false
  phone_number '212 664 7665'
  skype_id 'my_skype_id'
  country 'CA'
  time_zone 'Eastern Time (US & Canada)'
  city 'Toronto'
  state_or_province 'Ontario'
  postal_code 'M4B 3P6'
  status 'active'
  languages ["en", "es", "fr"]
  license_number '1234asdf'
  licensing_authority 'awesome authority'
  other_religions ["buddhism"]

  # after_create { |counselor| counselor.set_all_availability! }
end

Fabricator(:unavailable_counselor, from: :counselor) do
  # after_create { |counselor| counselor.unset_all_availability! }
end
