require 'bundler/capistrano'
load 'deploy/assets'

set :application, "cooking"

set :scm, :git
set :repository,  "git@github.com:koljakube/cooking.git"
set :scm_username, "koljakube"

server "dyn.koljaku.be", :app, :web, :db, primary: true

set :default_environment, {
  'PATH' => "~/.gem/ruby/1.9.1/bin/:$PATH"
}

set :deploy_to, "/var/wwwapps/cooking"
set :rails_env, "production"

set :user, "deployer"
set :group, "web"
set :use_sudo, false

set :unicorn_binary, "/home/deployer/.gem/ruby/1.9.1/bin/unicorn_rails"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"

namespace :deploy do
  task :start, roles: :app, except: { no_release: true } do
    try_sudo "cd #{current_path} && #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, roles: :app, except: { no_release: true } do
    try_sudo "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, roles: :app, except: { no_release: true } do
    try_sudo "#{try_sudo} kill QUIT `cat #{unicorn_pid}`"
  end
  task :reload, roles: :app, except: { no_release: true } do
    try_sudo "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, roles: :app, except: { no_release: true } do
    stop
    start
  end
end

after "deploy", "deploy:migrate"