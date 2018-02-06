#
# Cookbook:: tracks-app
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "remove_default_conf" do
  cwd "/etc/nginx/conf.d"
  command "mv default.conf default.conf.sample"
  user 'root'
  only_if { File.exist?("/etc/nginx/conf.d/default.conf") }
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template "site.conf" do
  path "/etc/nginx/conf.d/site.conf"
  source "default/site.conf.erb"
  owner "root"
  group "root"
  mode  "0644"
  notifies :restart, "service[nginx]"
end

%w[ /srv/www ].each do |path|
  directory path do
    owner 'www-data'
    group 'www-data'
    mode  "0755"
  end
end

template '/srv/www/index.html' do
  source 'default/index.html.erb'
  owner 'www-data'
  group 'www-data'
  mode  "0755"
end




