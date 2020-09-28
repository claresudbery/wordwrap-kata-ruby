#!/usr/bin/env ruby

require_relative './wordwrap'
require 'optparse'

puts "--------------"
puts 'Welcome to Word Wrap'
puts "--------------"
puts "We want two inputs: A string and a line length. We'll wrap your text to your line length."
puts "For instance the inputs 'hello world', 5 will output two lines - 'hello' and 'world' - like this:"
puts "--------------"
puts WordWrap.new.wrap("hello world", 5)
puts "--------------"

options = {}
OptionParser.new do |parser|
   parser.on("-n", "--text TEXT", "The text you want to wrap") do |value|
       options[:text] = value
    end
  end.parse!
  puts WordWrap.new.wrap(options[:text], 5)