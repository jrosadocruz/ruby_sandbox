# Lambdas are functions without a name.
l = lambda do
  "Do or do not"
end
# puts l.call

l = lambda do |string|
  if string == "try"
    return "There's no such thing"
  else
    return "Do or do not"
  end
end

# puts l.call("try")

### Add a lambda to the following code which increments any number passed to it by 1.
Increment = lambda { |number| number + 1 }

puts Increment.call(1)
