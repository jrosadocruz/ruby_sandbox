def do_something
  yield "Hello" if block_given?
end

do_something do |msg|
  puts "#{msg}, José"
end


def print_returned_value

  if block_given?
    value = yield
    puts "The returned vales is: #{value}"
  end

end

print_returned_value do
  5.0/2
end


def each_word(words)
  words.each { |word| yield( word ) }
end

each_word ["jose", "ricardo", "rosado"] { |word| puts word }


class Document
  attr_reader :content

  def initialize text
    @content = text
  end

  def each_character
    i = 0

    while i < @content.length
      yield (@content[i])
      i += 1
    end
  end

end

content = "Jose Ricardo"
doc = Document.new( content )

doc.each_character do |char|
  puts char.upcase
end


