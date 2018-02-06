# <a name="title"></a> Tracks Chef cookbook :) 
Development repository for Tracks Chef cookbook

[![Build Status](https://travis-ci.org/jrholowka/chef-tracks.svg?branch=master)](https://travis-ci.org/jrholowka/chef-tracks)
[![Maintainability](https://api.codeclimate.com/v1/badges/d623cae9999d17540828/maintainability)](https://codeclimate.com/github/jrholowka/chef-tracks/maintainability)

## Requirements

* [Docker][docker_installation] **(>= 1.5)**

## Installation and Setup
```
./install-chefdk.sh
```

## Provisioning instance
```
kitchen converge
```

## Testing
```
kitchen verify
```