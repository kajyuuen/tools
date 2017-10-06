# coding: utf-8
role :app, %w{username@hostname}
role :web, %w{username@hostname}
role :db,  %w{username@hostname}

server 'hostname', #サーバ名
user: 'username', #実行ユーザ
roles: %w{web app db}, # サーバの役割
ssh_options: {
    forward_agent: true, 
    keys: %w(~/.ssh/xxx), # 適当に置き換える
    auth_methods: %w(publickey),
}

set :puma_state, "/app_name/shared/tmp/puma.state"
set :puma_pid, "/app_name/shared/tmp/pids/puma.pid"
set :puma_bind, "unix:///app_name/shared/tmp/sockets/puma.sock"    #accept array for multi-bind
set :bundle_without, %w{test}.join(' ')
