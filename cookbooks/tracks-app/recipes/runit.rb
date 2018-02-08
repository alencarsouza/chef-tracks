#
# Cookbook:: tracks-app
# Recipe:: runit
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

# Referenced from http://kchard.github.io/runit-quickstart/

app_name        = node['application']['app_name']
document_root   = node['application']['document_root']
bundler_command = 'bundle exec rails server -e production'

package 'runit'

# create essential directories for runit
["/etc/sv/#{app_name}",
 "/etc/sv/#{app_name}/log",
 "/var/log/#{app_name}"].each do |dir|
  directory dir do
    mode '0755'
    recursive true
  end
end

# create a run script
template "/etc/sv/#{app_name}/run" do
  source 'default/run-tracks.erb'
  mode '0755'
  variables(
    app_name: app_name,
    document_root: document_root,
    runit_command: bundler_command
  )
end

# create a log script
template "/etc/sv/#{app_name}/log/run" do
  source 'default/run-tracks-log.erb'
  mode '0755'
  variables(
    app_name: app_name
  )
end

execute 'make_this_script_executable' do
  cwd '/etc/sv'
  command "chmod +x #{app_name}/run && chmod +x #{app_name}/log/run"
  user 'root'
end

# make a symbolic link between runit folder and upstart folder
link "/etc/service/#{app_name}" do
  to "/etc/sv/#{app_name}"
  link_type :symbolic
  action :create
end
