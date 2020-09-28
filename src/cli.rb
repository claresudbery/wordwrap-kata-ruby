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
    parser.on("-t", "--text=TEXT", "The text you want to wrap") do |value|
        options[:text] = value
    end
    parser.on("-l", "--len=LENGTH", "Max line length (text will wrap after this length)") do |value|
        options[:len] = value
    end
    parser.on("-h", "--help", "Prints this help") do
        puts parser
        exit
    end
end.parse!

if options[:text] && options[:len]
    puts WordWrap.new.wrap(options[:text], options[:len])        
else
    puts "Please give values for --text (-t) and --len (-l)"  
end 