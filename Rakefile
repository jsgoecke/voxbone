require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "voxbone"
  gem.homepage = "http://github.com/jsgoecke/voxbone"
  gem.license = "MIT"
  gem.summary = "Library for the Voxbone API"
  gem.description = "Ruby library wrapping the Voxbone SOAP API"
  gem.email = "jason@goecke.net"
  gem.authors = ["Jason Goecke"]
  gem.add_runtime_dependency 'savon'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new