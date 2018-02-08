#
# Cookbook:: tracks-app
# Recipe:: postgresql
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

# Referenced from https://goo.gl/BDPF2A

database_name     = node['postgresql']['database_name']
database_username = node['postgresql']['database_username']
database_password = node['postgresql']['database_password']

package 'postgresql'
package 'postgresql-contrib'

service 'postgresql' do
  supports status: true, restart: true, reload: true
  action [:restart]
end

# change postgres password
execute 'change postgres password' do
  user 'postgres'
  command "psql -c \"alter user postgres with password '#{database_password}';\""
end

# create new postgres user
execute 'create new postgres user' do
  user 'postgres'
  command "psql -c \"create user #{database_username} with password '#{database_password}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{database_username}'\" | wc -l`.chomp == '1' }
end

# create new postgres database
execute 'create new postgres database' do
  user 'postgres'
  command "psql -c \"create database #{database_name} owner #{database_username};\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{database_name}'\" | wc -l`.chomp == '1' }
end
