# Calling Blocks
def get_name(prompt, &block)
  if block_given? # `block_given?` return `true` if the method uses a block when is called
    print prompt + ": "
    name = gets.chomp

    print "Age: "
    age = gets.chomp

    yield(name, age)
    # block.call(name, age) # No need to use the & to use the block.
    return name
  else
    puts "No block given"
  end
end

jose = get_name("Enter your name") do |name, age|
  puts "That's a cool name, #{name}! Age #{age}"
end

# puts "name: #{jose}"