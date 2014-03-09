# config valid only for Capistrano 3.1
lock "3.1.0"

set :application, "theitskillboard"
set :deploy_user, "deployer"
set :keep_releases, 5

# setup scm
set :scm, :git
set :repo_url, "git@github.com:dobrinov/#{fetch(:application)}.git"
set :branch,   "master"

# setup rbenv
set :rbenv_type, :system
set :rbenv_ruby, "2.1.1"
set :rbenv_custom_path, "/home/#{fetch(:deploy_user)}/.rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :deploy_to, "/home/#{fetch(:deploy_user)}"

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :nginx do

  task :start do
    on roles(:web) do
      execute "sudo service nginx start"
    end
  end

end