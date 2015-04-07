daemonize       true
pidfile         'tmp/pids/puma.pid'
state_path      'tmp/pids/puma.state'
stdout_redirect 'log/puma_access.log', 'log/puma_error.log'
bind            "unix://#{File.join(Dir.pwd,'tmp','sockets','puma.sock')}"