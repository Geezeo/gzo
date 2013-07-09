require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"

RSpec::Core::RakeTask.new(:spec)

task :default => %w(spec)

Dir.glob("tasks/*.rake").each { |task| import task }

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.options = ['--any', '--extra', '--opts']
end
