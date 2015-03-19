def demonstrate_block(number)
  yield(number)
end

demonstrate_block(4) do |number|
  # puts number + 10
end

def calculate(a, b)
  yield(a, b)
end

puts calculate(2, 3) { |a, b| a + b }
puts calculate(2, 3) { |a, b| a - b }
puts calculate(2, 3) { |a, b| a * b }