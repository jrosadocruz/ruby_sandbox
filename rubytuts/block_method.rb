def block_method
  puts "Called from the method"
  yield
  puts "Again from the method"
end

block_method do
  puts "Yield"
end