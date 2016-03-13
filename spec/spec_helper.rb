require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift File.expand_path("../../spec", __FILE__)

require "todolist/config/application.rb"
require "rspec"
require "rack/test"

ENV["RACK_ENV"] = "test"
