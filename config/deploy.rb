set :application, "cooking"
set :repository,  "git@github.com:koljakube/cooking.git"
set :scm, :git

set :deploy_to, "/var/wwwapps/cooking"

server "dyn.koljaku.be", :app, :web, :db, primary: true

set :scm_username, "koljakube"
