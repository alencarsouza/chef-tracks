#
# Cookbook:: tracks-app
# Recipe:: application
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

document_root     = node['application']['document_root']
app_repository    = node['application']['app_repository']
app_branch        = node['application']['app_branch']
token             = node['application']['token']
database_adapter  = node['postgresql']['database_adapter']
database_host     = node['postgresql']['database_host']
database_encoding = node['postgresql']['database_encoding']
database_name     = node['postgresql']['database_name']
database_username = node['postgresql']['database_username']
database_password = node['postgresql']['database_password']
timezone          = node['system']['timezone']

# Clone TracksApp repository
git document_root.to_s do
  repository app_repository
  revision app_branch
  action :sync
end

# gem "pg", "~> 0.20.0" is needed since PostgreSQL is not supported by default.
template "#{document_root}/Gemfile" do
  source 'Gemfile.erb'
  mode '0755'
end

template "#{document_root}/config/database.yml" do
  source 'default/database.yml.erb'
  mode '0644'
  variables(
    db_adapter: database_adapter,
    db_name: database_name,
    db_encoding: database_encoding,
    db_hostname: database_host,
    db_username: database_username,
    db_password: database_password
  )
end

template "#{document_root}/config/site.yml" do
  source 'default/site.yml.erb'
  mode '0644'
  variables(
    secret_token: token,
    time_zone: timezone
  )
end

execute 'install_dependencies' do
  cwd document_root.to_s
  command 'bundle install --without development test'
  user 'root'
end

execute 'migration_assets' do
  cwd document_root.to_s
  command 'bundle exec rake db:migrate RAILS_ENV=production --trace && bundle exec rake assets:precompile RAILS_ENV=production --trace'
  user 'root'
end
