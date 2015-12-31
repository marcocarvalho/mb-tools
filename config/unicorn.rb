if ENV['RAILS_ENV'] == 'production'
  app_dir = ENV['APP_ROOT'] || "/usr/src/app"
else
  app_dir = File.expand_path('../..', __FILE__)
end
 
working_directory app_dir
 
pid "#{app_dir}/tmp/unicorn.pid"
 
stderr_path "#{app_dir}/log/unicorn.stderr.log"
stdout_path "#{app_dir}/log/unicorn.stdout.log"
 
worker_processes ENV['APP_PROCESSES'] || 4
listen "/tmp/unicorn.sock", :backlog => 64

timeout 30