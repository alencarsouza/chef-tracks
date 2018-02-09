# deploy settings
default['application']['app_repository'] = 'https://github.com/TracksApp/tracks.git'
default['application']['app_branch']     = '2.3_branch'
default['application']['app_name']       = 'tracks '
default['application']['document_root']  = '/srv/www/tracks'
default['application']['token']          = 'c2e46be6e2601df7251f2d90cbb7abedb828b8bd0f0a13e8913c474e33b3701c385c470feb3541bbd85c37ac5ea1f1fbf97e345075a1fed5c4a181817f0b375c'

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
