#
# Cookbook:: tracks-app
# Recipe:: mariadb
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

apt_repository 'mariadb' do
  uri "http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.2/#{node['platform']}"
  distribution "#{node['lsb']['codename']}"
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

