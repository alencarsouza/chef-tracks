#
# Cookbook:: tracks-app
# Recipe:: security
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

# install essential packages
package %w(fail2ban unattended-upgrades ufw)

# configure the packages you want to automatically upgrade
template '/etc/apt/apt.conf.d/20auto-upgrades' do
  source '20auto-upgrades.erb'
  mode '0644'
end

execute 'ssh_disable_PasswordAuthentication' do
  user 'root'
  command "sed -i 's/^#\?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config"
  notifies :restart, 'service[ssh]', :immediately
end

service 'ssh' do
  action :nothing
end

# This is needed to avoid "ip6tables v1.4.21: can't initialize ip6tables table `filter'" error
execute 'disable_ipv6' do
  user 'root'
  command "sed -i 's/^IPV6=yes/IPV6=no/' /etc/default/ufw"
end

execute 'firewall_settings' do
  user 'root'
  command "ufw allow 22 && ufw allow http && ufw --force enable"
end