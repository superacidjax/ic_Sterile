# Your Applications "Name"
set :application, "icouch"

# The URL to your applications repository
set :repository,  "git@github.com:hashrocket/icouch.git"
set :scm, "git"

# Uncomment this line if you're using SVN.  It makes deployments much faster
set :deploy_via, :remote_cache

# Require subversion to do an export instead of a checkout.
set :checkout, 'export'

# The user you are using to deploy with (This user should have SSH access to your server)
set :user, "deploy"

# We want to deploy everything under your user, and we don't want to use sudo
set :use_sudo, false

# Where to deploy your application to.
set :deploy_to, "/srv/#{application}"

# -------------------------------- Server Definitions --------------------------------
# Define the hostname of your server.  If you have multiple servers for multiple purposes, we can define those below as well.
set :server_name, "vs103856.blueboxgrid.com"

set :rails_env, 'production'

# We're assuming you're using a single server for your site, but if you have a separate asset server or database server, you can specify that here.
role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

# Use RVM
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, 'ruby-1.9.2@icouch'        # Or whatever env you want it to run in.

# -------------------------------- Final Config --------------------------------
default_run_options[:pty] = true

desc "Install bundled gems into ./.bundle"
task :bundle do
    run "cd #{release_path}; bundle install .bundle"
end

after 'deploy:update_code' do
    # Link database file
    run "ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"

    # Link Bundle
    run "ln -s #{deploy_to}/shared/bundle #{release_path}/.bundle"

    # Bundle gems
    bundle

    run "cd #{release_path} && rake barista:brew RAILS_ENV=#{rails_env}"
end

namespace :deploy do
    task :restart do
        run "touch #{deploy_to}/current/tmp/restart.txt"
    end

    task :start do
        run "touch #{deploy_to}/current/tmp/restart.txt"
    end
end

        require './config/boot'
        require 'airbrake/capistrano'
