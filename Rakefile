#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'
require './application'

task :default => :process

desc "Run all tests"
task :test do
  sh "bundle exec rspec ."
end

desc "Compiles an XML file into static html file in output dir"
task :process, [:input_file,:output_dir] do |t, args|
  args.with_defaults(
    :input_file => "./works.xml",
    :output_dir => "./html"
  )
  puts "Processing #{args[:input_file]}"
  puts "Output Dir #{args[:output_dir]}"

  # Process something here!!
  Processor.process(args[:input_file], args[:output_dir])
end
