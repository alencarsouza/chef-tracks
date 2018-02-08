#
# Cookbook:: tracks-app
# Recipe:: mariadb
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

database_name     = node['mariadb']['database_name']
database_username = node['mariadb']['database_username']
database_password = node['mariadb']['database_password']

apt_repository 'mariadb' do
  uri "http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.2/#{node['platform']}"
  distribution (node['lsb']['codename']).to_s
  components ['main']
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '0xcbcb082a1bb943db'
  action :add
end

package 'mariadb-server' do
  action :install
end

service 'mysql' do
  supports status: true, restart: true, reload: true
  action   [:enable, :start]
end

execute 'create-database' do
  command "mysql -u root -e 'CREATE DATABASE IF NOT EXISTS #{database_name} CHARACTER SET utf8'"
  user 'root'
end

execute 'create-database-user' do
  command "mysql -u root -e \"CREATE USER IF NOT EXISTS '#{database_username}'@'localhost' IDENTIFIED BY '#{database_password}'; GRANT ALL PRIVILEGES ON *.* TO '#{database_username}'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES\""
  user 'root'
end
