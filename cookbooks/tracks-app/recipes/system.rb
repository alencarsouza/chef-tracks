#
# Cookbook:: tracks-app
# Recipe:: system
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

timezone = node['system']['timezone']

# update apt cache daily
apt_update 'daily' do
  frequency 86_400
  action :periodic
end

# install essential packages
package %w(build-essential curl git-core libcrypto++-dev libcurl4-openssl-dev libffi-dev libgmp-dev libgmp3-dev libmariadbd-dev libnetcdf-dev libpq-dev libreadline-dev libsqlite3-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev make python-software-properties software-properties-common zlib1g zlib1g-dev)

execute 'timezone_setup' do
  command "echo #{timezone} > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  user 'root'
end

execute 'install_english_locale' do
  command 'locale-gen en_US.UTF-8 && locale-gen en_US && locale-gen'
  user 'root'
end
