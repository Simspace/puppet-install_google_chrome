# install_google_chrome

#### Table of Contents
1. [Overview](#overview)
2. [Description](#description)
3. [Dependencies](#dependencies)
4. [Development](#development)

## Overview
This module will install the enterprise version of the Google Chrome installer for windows

## Description
In params.pp is the location to the installer.
In your site.pp
```puppet
node 'cheese.com' {
  class {'install_google_chrome':}
}
```

## Dependencies
staging
ACL
