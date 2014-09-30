#config.pp
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

class kamailio::config (
  $with_tls = false,
  $with_websockets = false,
  $manage_config
) inherits kamailio {
  File {
    owner => 'root',
    group => 'root',
  }

  if ($manage_config) {
    file { '/etc/kamailio/kamailio-default.cfg':
      content => template('kamailio/kamailio.cfg.erb'),
      mode    => '0644',
      notify  => Class['kamailio::service'],
    }

    file { '/etc/kamailio/kamailio-local.cfg':
      content => template('kamailio/kamailio-local.cfg.erb'),
      mode    => '0644',
      notify  => Class['kamailio::service'],
    }

    file { '/etc/default/kamailio':
      content => template('kamailio/etc_default_kamailio.erb'),
      mode    => '0644',
      notify  => Class['kamailio::service'],
    }

    if ($with_tls) {
      file { '/etc/kamailio/tls.cfg':
        content => template('kamailio/tls.cfg.erb'),
        mode    => '0644',
        notify  => Class['kamailio::service'],
      }
    }
  }
}
