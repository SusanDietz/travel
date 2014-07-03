# config valid only for Capistrano 3.1
lock '3.1.0'

server "217.23.138.165", user: "rj", roles: [:web, :app, :db], primary: true

set :application, 'travel'
set :repo_url, 'git@github.com:epifanov/travel.git'

set :shared_path, "#{deploy_to}/shared"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :rails_env, "production"

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :deploy_user, 'rj'
set :rvm_ruby_version, "1.9.3"

namespace :deploy do
  after :publishing, :restart
  
  desc 'Start application'
  task :start do
    on roles(:app) do
      execute "/etc/init.d/unicorn_#{fetch(:application)} start", raise_on_non_zero_exit: false
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      execute "/etc/init.d/unicorn_#{fetch(:application)} stop", raise_on_non_zero_exit: false
    end
  end

  desc 'Restart Application'
  task :restart do
    on roles(:app) do
      execute "/etc/init.d/unicorn_#{fetch(:application)} restart", raise_on_non_zero_exit: false
    end
  end
  
end

#after 'deploy:stop',    'delayed_job:stop'
#after 'deploy:start',   'delayed_job:start'
#before 'deploy:stop',"symlink:setup_config"
