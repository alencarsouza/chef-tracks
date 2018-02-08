# deploy settings
default['application']['app_repository'] = 'https://github.com/TracksApp/tracks.git'
default['application']['app_branch']     = '2.3_branch'
default['application']['app_name']       = 'tracks_app'
default['application']['document_root']  = '/srv/www/tracks'
default['application']['token']          = '456789435345879'

# database settings
default['postgresql']['database_adapter']  = 'postgresql'
default['postgresql']['database_host']     = '127.0.0.1'
default['postgresql']['database_encoding'] = 'unicode'
default['postgresql']['database_name']     = 'tracks'
default['postgresql']['database_username'] = 'tracks'
default['postgresql']['database_password'] = 'tracks'

# ruby settings
default['ruby']['ruby_version']          = '2.1'

# system settings
default['system']['timezone']            = 'Europe/Berlin'
