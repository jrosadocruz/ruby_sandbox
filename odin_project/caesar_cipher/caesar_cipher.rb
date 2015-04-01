def string_to_num(string)
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
# nums     = [ 0,   1,   2,   3,   4,   5,   6,   7,   8,   9,   10,  11,  12,  13,  14,  15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25]
  array_of_characters = string.split('')
  result = []

  array_of_characters.each do |char|
    result << alphabet.index(char)
  end

  result

end

# p string_to_num('z').join

def num_to_string(num_array)
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  result = ""
  num_array.each do |num|
    result << alphabet[num]
  end
  result
end

p num_to_string([25])

def caesar_cipher(string, factor = 1)
  array_of_chars = string_to_num(string)
  add_factor = array_of_chars.map { |num| num += factor  }
  result = num_to_string(add_factor)
  p result
end

# caesar_cipher("z", 1)
