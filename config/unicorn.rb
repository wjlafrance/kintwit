worker_processes 4 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
preload_app true

after_fork do |server, worker| 
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection 
end