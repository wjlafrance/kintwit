#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

KinTwit::Application.load_tasks
 
task :default => [:spec]

desc "Show test coverage in browser"
task :coverage => [:spec] do
  system("open coverage/index.html")
end

desc "Push to Heroku"
task :heroku do
  system("git push heroku master")
end
