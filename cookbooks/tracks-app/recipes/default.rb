#
# Cookbook:: tracks-app
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'nginx'
include_recipe 'tracks-app::install'
