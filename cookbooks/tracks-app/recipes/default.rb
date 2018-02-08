#
# Cookbook:: tracks-app
# Recipe:: default
#
# Copyright:: 2018, Alencar Junior, All Rights Reserved.

include_recipe 'tracks-app::system'
include_recipe 'tracks-app::postgresql'
include_recipe 'tracks-app::nginx'
include_recipe 'tracks-app::ruby'
include_recipe 'tracks-app::application'
include_recipe 'tracks-app::runit'
include_recipe 'tracks-app::security'
