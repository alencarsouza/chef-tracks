name 'app'
description 'A role to configure Tracks application'

run_list(
    'recipe[nginx]',
    'recipe[tracks-app::default]'
)