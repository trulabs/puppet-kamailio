# init.pp
# == Class: kamailio
#
# This module installs kamailio, configures it, and can ensure it is running
#
# === Examples
#
# * Installation:
#   class { 'kamailio': }
#
# === Authors
#
# * Giacomo Vacca <mailto:giacomo.vacca@truphone.com>
#
# === License
#
# Copyright (c) 2014, Truphone
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
# 
# Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
# Neither the name of Truphone nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# === Parameters
#
# [*service_enable*]
#   Boolean.
#   Default: false.
#
# [*service_ensure*]
#   String. Ensure the service is running or stopped.
#   Options: running, stopped
#   Default: running
# 
# [*service_manage*]
#   Boolean. Whether Puppet should manage this service.
#   Default: false
# 
# [*manage_repo*]
#   Boolean. Whether Puppet should manage the package repo.
#   Default: false
# 
# [*package_ensure*]
#   String. Ensure the package is present or not.
#   Options: present, latest, absent
#   Default: present
# 
# [*package_name*]
#   String. What package name to use for kamailio.
#   Default: kamailio
#
# [*with_tls*]
#   Boolean. Whether TLS should be enabled.
#   Default: false
# 
# [*manage_config*]
#   Boolean. Whether Puppet should manage the configuration files.
#   Default: true
# 
# [*with_websocket*]
#   Boolean. Whether WebSockets should be enabled.
#   Default: false
# 
class kamailio(
  $service_enable = $kamailio::params::service_enable,
  $service_ensure = $kamailio::params::service_ensure,
  $service_manage = $kamailio::params::service_manage,
  $manage_repo    = $kamailio::params::manage_repo,
  $package_ensure = $kamailio::params::package_ensure,
  $package_name   = $kamailio::params::package_name,
  $with_tls       = $kamailio::params::with_tls,
  $manage_config  = $kamailio::params::manage_config,
  $with_websockets = $kamailio::params::with_websockets,
) inherits kamailio::params {

  validate_string($package_ensure, $package_name)
  validate_bool($service_enable, $service_manage, $manage_repo, $manage_config)

  class { '::kamailio::install':
    package_ensure  => $package_ensure,
    package_name    => $package_name,
    with_tls        => $with_tls,
    with_websockets => $with_websockets,
  } ->
  class { '::kamailio::config':
    with_tls        => $with_tls,
    with_websockets => $with_websockets,
    manage_config   => $manage_config,
  }  ->
  class { '::kamailio::service':
    service_ensure => $service_ensure,
    service_manage => $service_manage,
    service_enable => $service_enable,
  }

  if ($manage_repo) {
    class { '::kamailio::repo': }
  }
}
