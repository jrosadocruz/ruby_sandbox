def count_frecuency(array)
  hash = Hash.new(0)

  array.each do |item|
    hash[item] += 1
  end

  hash

end

def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end

raw_text = %{The problem breaks down into two parts. First, given some text as a string, return a list of words. That sounds like an array. Then, build a count for each distinct word. That sounds like a use for a hash---we can index it with the word and use the corresponding entry to keep a count.}

text_to_array = words_from_string(raw_text)
# p text_to_array

count = count_frecuency(text_to_array)
# p count

sorted = count.sort_by { |word, count| count }

top_5 = sorted.last(5).reverse
# p top_5

puts "<--- Top 5 word repetition --->"
top_5.each do |item|
  word = item[0].capitalize
  count = item[1]
  puts "#{word}: #{count}"
end