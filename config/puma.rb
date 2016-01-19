#!/usr/bin/env puma

directory '/home/deploy/apps/blog/current'
rackup "/home/deploy/apps/blog/current/config.ru"
environment 'staging'

pidfile "/home/deploy/apps/blog/shared/tmp/pids/puma.pid"
state_path "/home/deploy/apps/blog/shared/tmp/pids/puma.state"
stdout_redirect '/home/deploy/apps/blog/shared/log/puma_access.log', '/home/deploy/apps/blog/shared/log/puma_error.log', true


threads 0,16

bind 'unix:///home/deploy/apps/blog/shared/tmp/sockets/puma.sock'

workers 1



prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/deploy/apps/blog/current/Gemfile"
end


