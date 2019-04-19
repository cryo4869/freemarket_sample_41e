lock "~> 3.11.0"

set :application, "freemarket_sample_41e"
set :repo_url, "git@github.com:yukihayashi06/freemarket_sample_41e.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }
append :linked_files, 'config/database.yml', 'config/master.key'
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :ssh_options, auth_methods: ['publickey'],
    keys: ['~/.ssh/merukari_keypair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end