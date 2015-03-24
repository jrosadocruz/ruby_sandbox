require './count_frequency.rb'
require './words_from_string.rb'

raw_text = %{The problem breaks down into two parts. First, given some text as a string, return a list of words. That sounds like an array. Then, build a count for each distinct word. That sounds like a use for a hash---we can index it with the word and use the corresponding entry to keep a count.}

words = words_from_string(raw_text)
# puts words.inspect
#
frequency = count_frequency(words)
# puts frequency.inspect

sorted = frequency.sort_by { |word, count| count  }
# puts sort.inspect

top_five = sorted.last(5)
# puts top_five.inspect

top_five.each do |item|
  word = item[0]
  count = item[1]
  puts "#{word}: #{count}"
end

