# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'elisios'
set :repo_url, 'git@github.com:diegorubin/elisios.git'
server 'elisios', user: 'caronte', roles: %{app}
set :deploy_to, '/applications/elisios'

set :linked_files, %w{
  db/elisios_production.sqlite3 config/database.yml config/secrets.yml
}

namespace :deploy do

  after :deploy, 'deploy:restart'

end

