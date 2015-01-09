#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'
require './application'

task :default => :test

task :test do
  sh "bundle exec rspec ."
end

task :process, [:input_file,:output_dir] do |t, args|
  args.with_defaults(
    :input_file => "./works.xml",
    :output_dir => "./html"
  )
  # Process
end
