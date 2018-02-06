# deploy settings
default['application']['app_repository'] = 'https://github.com/TracksApp/tracks.git'
default['application']['app_branch']     = 'master'
default['application']['document_root']  = '/srv/www/tracks'

# database settings
default['database']['database_adapter']  = 'mysql2'
default['database']['database_host']     = '127.0.0.1'
default['database']['database_encoding'] = 'utf8'
default['database']['database_name']     = 'tracks'
default['database']['database_username'] = 'tracks'
default['database']['database_password'] = 'tracks'

# ruby settings
default['ruby']['ruby_version']          = '2.4'

# system settings
default['system']['timezone']            = 'Europe/Berlin'


