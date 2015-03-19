words = []

while true
  print "Type a word: "
  input = gets.chomp
  break if input.empty?

  words << input
end

puts words

