#!/usr/bin/env ruby

require_relative './wordwrap'

$stdout.sync = true

puts "--------------"
puts 'Welcome to Word Wrap'
puts "--------------"
puts "We want two inputs: A string and a line length. We'll wrap your text to your line length."
puts "For instance the inputs 'hello world', 5 will output two lines - 'hello' and 'world' - like this:"
puts "--------------"
puts WordWrap.new.wrap("hello world", 5)
puts "--------------"

puts "What is your text?"
text = gets.chomp
puts "--------------"

puts "What is your line length?"
length = gets.chomp
puts "--------------"

puts "Here is your wrapped text:"
puts "--------------"
puts WordWrap.new.wrap(text, length)