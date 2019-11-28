# Set the working application directory
# working_directory "/path/to/your/app"
# working_directory "/var/www/my_app"
working_directory app_path


# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
# pid "/var/www/my_app/pids/unicorn.pid"
pid app_path + '/tmp/unicorn.pid'


# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
# stderr_path "/var/www/my_app/log/unicorn.log"
# stdout_path "/var/www/my_app/log/unicorn.log"
stderr_path app_path + '/log/unicorn.log'
stdout_path app_path + '/log/unicorn.log'


# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
# listen "/tmp/unicorn.myapp.sock"

listen app_path + '/tmp/unicorn.sock', backlog: 64

# For development, you may want to listen on port 3000 so that you can make sure
# your unicorn.rb file is soundly configured.
listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30