namespace :deploy do

  desc 'Deploy to staging'
  task :staging do
    remote = "git@heroku.com:icouch-staging.git"
    app = "icouch-staging"
    system "heroku maintenance:on --app #{app}"
    system "git push -f #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
    system 'git checkout master'
  end

  desc 'Deploy to production'
  task :production do
    remote = "git@heroku.com:icouch.git"
    app = "icouch"
    system "heroku maintenance:on --app #{app}"
    system "git push -f #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
    system 'git checkout master'
  end

end
