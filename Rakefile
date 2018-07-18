require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

desc "Run Thrift code generator"
task :thrift do
  system("thrift --gen rb --out ./lib lib/services.thrift")
end