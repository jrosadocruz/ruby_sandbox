# # Blocks
# def do_something
#   yield
# end

# # do_something do
# #   puts "José"
# # end

# def fibonacci_up_to(max)
#   num1 = 1
#   num2 = 1

#   while num1 <= max
#     yield num1
#     memo = num2
#     num2 = num1+num2
#     num1 = memo
#   end

# end


# # fibonacci_up_to(1000) { |num| print num, " " }


# def find(array)
#   selection = []
#   array.each do |item|
#     return item if yield item
#   end
# end

# def find_all(array)
#   selection = []
#   array.each do |item|
#     selection << item if yield item
#   end
#   selection
# end

# array = [1,2,3,4,5,8,15,22,25,51,55,100, 40,45]
# # puts array.inspect
# item = find(array) { |num| num % 5 == 0  }
# p item

# finds_all = find_all(array) { |num| num % 5 == 0 }
# p finds_all

def LongestWord(sen)

  array = sen.split
  longest = ""
  array.each do |word|
    current = word.gsub(/\W+/, '')
    longest = current if current.gsub(/\W+/, '').length > longest.length
  end
  # code goes here
  return longest

end

puts LongestWord("I love dogs")
puts LongestWord("a confusing /:sentence:/[ this is not!!!!!!!~")