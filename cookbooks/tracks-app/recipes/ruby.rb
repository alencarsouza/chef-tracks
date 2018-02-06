#
# Cookbook:: tracks-app
# Recipe:: ruby
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

apt_repository 'brightbox-ruby-ppa' do
  uri 'ppa:brightbox/ruby-ng'
  distribution node['lsb']['codename']
  components ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'C3173AA6'
end

package "ruby#{node['ruby']['ruby_version']}" do
  action :upgrade
end

package "ruby#{node['ruby']['ruby_version']}-dev" do
  action :upgrade
end

gem_package 'bundler' do
  gem_binary '/usr/bin/gem'
  action :upgrade
end


