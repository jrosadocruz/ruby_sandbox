def do_until_false some_input, some_proc

  input = some_input
  output = input

  while output
    input = output
    output = some_proc.call input
  end

  input

end


build_array_of_squares = Proc.new do |array|

  last_number = array.last

  if last_number == 0
    false
  else
    array.pop
    array << last_number * last_number
    array << last_number - 1
  end

end

puts do_until_false([5], build_array_of_squares).inspect