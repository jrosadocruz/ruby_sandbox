# Block Arguments
def get_name
  print "Enter your name: "
  name = gets.chomp
  yield(name) # you need to pass the arguments to yield before calling the method with its block.
  return name # method always return nil if i don't say what it should return
end

jose = get_name do |name|
  puts "That's a cool name, #{name}!"
end

puts "name: #{jose}"