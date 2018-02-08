name 'tracks-app'
maintainer 'Alencar Junior'
maintainer_email 'junior.holowka@gmail.com'
description 'Runs Tracks application'
version '0.0.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'apt'
depends 'nginx'
