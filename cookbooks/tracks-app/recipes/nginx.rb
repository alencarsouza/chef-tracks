#
# Cookbook:: tracks-app
# Recipe:: nginx
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

document_root = node['application']['document_root']

execute 'remove_default_conf' do
  cwd '/etc/nginx/conf.d'
  command 'mv default.conf default.conf.sample'
  user 'root'
  only_if { File.exist?('/etc/nginx/conf.d/default.conf') }
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template 'site.conf' do
  path '/etc/nginx/conf.d/site.conf'
  source 'default/nginx.conf.erb'
  owner 'root'
  group 'root'
  mode  '0644'
  variables(
    document_root: document_root
  )
  notifies :restart, 'service[nginx]'
end

%w( /srv/www ).each do |path|
  directory path do
    owner 'www-data'
    group 'www-data'
    mode  '0755'
  end
end
