#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'github_finder'

username = ARGV[0]
finder = GithubFinder::GithubFinder.new username
puts finder.find_preferred_language
