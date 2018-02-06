name 'mariadb'
maintainer 'Alencar Junior'
maintainer_email 'junior.holowka@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures MariaDB'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'apt'