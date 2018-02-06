#
# Cookbook:: tracks-app
# Recipe:: system
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.


# update apt cache daily
apt_update 'daily' do
  frequency 86_400
  action :periodic
end

# install essential packages
package %w(software-properties-common make git-core zlib1g zlib1g-dev libsqlite3-dev)


# timezone setup
execute "timezone_setup" do
  command 'echo "Etc/UTC" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'
  user 'root'
end




