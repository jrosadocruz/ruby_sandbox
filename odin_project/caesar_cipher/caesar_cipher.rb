def string_to_num(string)
  alphabet  = ("a".."z").to_a
  alphabet += ("A".."Z").to_a
  characters = string.split('')
  result = []

  characters.each do |char|
    if alphabet.include?(char.downcase)
      result << alphabet.index(char)
    else
      result << char
    end
  end

  result

end

def num_to_string(num_array)
  alphabet  = ("a".."z").to_a
  alphabet += ("A".."Z").to_a
  result = []

  num_array.each do |num|
    if num.class != String && num < alphabet.length
      result << alphabet[num]
    # Makes 'Z' convertion possible
    # also makes posible the use of negative numbers
    elsif num.to_i >= alphabet.length
      result << alphabet[num - alphabet.length]
    else
      result << num
    end
  end

  result.join

end

def caesar_cipher(string, factor = 1)
  time = Time.now
  array_of_chars = string_to_num(string)

  adds_factor = array_of_chars.map do |char|
    if char.class == Integer
      char += factor
    else
      char = char
    end
  end

  result = num_to_string(adds_factor)
  end_time = Time.now
  p end_time - time
  result
end



# caesar_cipher("abc",1)
# caesar_cipher("JoseZ!!@", 68)
# caesar_cipher("ZEIu!!@", -68)
string = "Implement a caesar cipher That takes in a String and the shift factor and then outputs the modified string!! !! 12"
cipher = p caesar_cipher(string, 5)
p caesar_cipher(cipher, -5)