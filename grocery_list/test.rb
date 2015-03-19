class String
  def is_number?
    true if Float(self) rescue false
  end
end

def test_item(item=nil)
  if item.nil?
    puts "item is nil"
    return false
  end

  if item.class == Fixnum || item.to_s.is_number?
    puts "Item is 0" if item == 0
    return false
  end

  if item.class == String
    puts "String is empty" if item.strip.empty?
    return false
  end

  return true
end
loop do
  puts "Name cannot be blank"
  user_name_input = gets.chomp.strip
  break if test_item(user_name_input) == true
  # return user_name_input
end

puts user_name_input