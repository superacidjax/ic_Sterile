unless Account.exists?(:email => 'admin@icouch.me')
  Admin.create!(
    :email => 'admin@icouch.me',
    :first_name => 'Admin',
    :last_name => 'User',
    :password => 'password',
    :password_confirmation => 'password',
    :time_zone => 'Beijing'
  )
end

Issue::TYPES.each do |issue|
  Issue.create(name: issue)
end
