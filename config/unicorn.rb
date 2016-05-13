@dir = "/var/www/esport42"

working_directory @dir
pid "#{@dir}/log/pids/unicorn.pid"
stderr_path "#{@dir}/log/unicorn.err.log"
stdout_path "#{@dir}/log/unicorn.out.log"

listen "/tmp/unicorn_grosproject.socket"

worker_processes 1
timeout 30
