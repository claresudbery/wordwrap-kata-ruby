#!/usr/bin/env ruby

# There are three ways of using this.
# 1. Enter both inputs as command line params, like this: 
#       ./src/wordwrap_cli.rb -t 'Hello world' -l 5
# 2. Pipe in the text input, and add the length as a command line param, like this: 
#       echo "Hello world" | ./src/wordwrap_cli.rb -l 5
# 3. Give the length as a command line param, then you will be prompted to enter the text on the command line. Like this:
#       ./src/wordwrap_cli.rb -l 5
#       (Then enter Hello world on the command line afterwards)


require_relative './wordwrap'
require 'optparse'

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
    stdinput = gets.chomp
    if stdinput && options[:len]
        puts WordWrap.new.wrap(stdinput, options[:len])
    else
        puts "Please give values for --text (-t) and --len (-l)"  
    end
end 