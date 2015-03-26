# First way to get the file into a single string
# text = ''
# line_count = 0

# File.open("oliver.txt").each do |line|
#   line_count += 1
#   text << line
# end

# p "#{line_count} lines"
# p text

# Second way to get the file into a single string
lines = File.readlines("oliver.txt") # gets every line into an array
line_count = lines.size # size of the array
text = lines.join # joins the array
total_character = text.length
total_character_nospaces = text.gsub(/\s+/,'').length
word_count = text.split.length

paragraph_count = text.split(/\n\n/).length

# \. is used because . represents 'any character' in RegEx.
# \? is used because ? represents 'zero or one instances of the previous character' in RegEx.
# | (pipes) means that each should be treated separately.
sentence_count = text.split(/\.|\?|!/).length

stopwords = %w{the a by on for of are with just but and to the my I has some in}

words = lines.join.scan(/\w+/)
# p words
keywords = words.select { |word| !stopwords.include?(word) }
# p keywords.join(' ')

# p lines
# p text
puts "Total lines: #{line_count}"
puts "Total paragraph: #{paragraph_count}"
puts "Total sentences: #{sentence_count}"
puts "Total words: #{word_count}"
puts "Total characters: #{total_character}"
puts "Total characters excluding spaces: #{total_character_nospaces}"

puts "#{sentence_count / paragraph_count} sentences per paragraph (avarage)"
puts "#{word_count / sentence_count} words per sentences (avarage)"
puts "#{total_character / word_count} characters per word (avarage)"



