
set :stages, %w(production)
set :default_stage, "production"
require "capistrano/ext/multistage"

set :application, "instantcompanyhandbook.com"

set :user, "applicake"

set :scm, :git
set :repository, "git@github.com:applicake/instantcompanyhandbook.git"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

set :default_shell, "/bin/bash --login"


# bundler settings, overridden in stage specific scripts
require "bundler/capistrano"
#set :bundle_without, [:development, :test, :deployment]

namespace :deploy do
  
  desc "Restart passenger"
  task :restart do
    run "touch #{release_path}/tmp/restart.txt"
  end

  task :symlink_config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Migrate database."
  task :migrate do
    run "cd #{release_path} && RAILS_ENV=production rake db:migrate"
  end
  
end


namespace :delayed_job do
  desc "Start delayed_job process" 
  task :start, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} script/delayed_job start " 
  end

  desc "Stop delayed_job process" 
  task :stop, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} script/delayed_job stop " 
  end

  desc "Restart delayed_job process" 
  task :restart, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} script/delayed_job restart" 
  end
end

after 'deploy:update_code', 'deploy:symlink_config',  'deploy:migrate', 'delayed_job:restart'
