# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
require(File.join(File.dirname(__FILE__),'../../..','config', 'boot'))

require 'rake'
require 'rubygems'
require 'rake/rdoctask'
require 'spec/rake/spectask'

desc 'Default: run unit tests.'
task :default => :spec

desc 'Test the webauth plugin.'
Spec::Rake::SpecTask.new(:spec) do |t|
  # This is needed to cause it to not use the default
  # NOTE: if the database is set by some goofy ruby call relative to the name of the directory, this won't work
  ENV["RAILS_ENV"] ||= 'test'
  t.spec_files = FileList['spec']
  t.spec_opts = ['--colour','--format nested']
  t.rcov=true
  t.rcov_opts << '--exclude /Library,/Users'
end

desc 'Generate documentation for the webauth plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'WebAuth'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

