#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

HangOverflow::Application.load_tasks


desc "Pick a random user as the winner"
task :reset => :environment do
  exec "rake db:drop && rake db:create && rake db:migrate && rake db:test:prepare"
end
