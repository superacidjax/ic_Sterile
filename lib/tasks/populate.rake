namespace :db do
  desc 'Populate test data'
  task :populate => ['db:reset', 'db:seed'] do

    populate 'clients' do
      @client = Fabricate(:client, email: 'client@example.com')
    end

    populate 'counselors' do
      @counselor = Fabricate(:counselor, email: 'counselor@example.com' )
    end

    populate 'concerns and specialities' do
      common_issues = []
      7.times do
        common_issues << Issue.all.sample
      end

      common_issues.each do |issue|
        @client.concerns.create(issue: issue)
        @counselor.specialities.create(issue: issue)
      end
    end

    populate 'sessions' do
      10.times do
        rand_date = Time.now + (rand(30) + 1).days
        Fabricate(:session, client: @client, counselor: @counselor, start_datetime: rand_date, end_datetime: (rand_date + 1.hour) )
      end
    end
  end

  def populate(name, &block)
    ActiveRecord::Migration.say_with_time("Populating #{name}...") do
     yield
    end
  end
end
