class TextCompressor

  attr_reader :unique, :index

  def initialize text
    @unique = []
    @index = []

    words = text.split
    words.each do |word|
      i = @unique.index( word )
      if i
        @index << i
      else
        @unique << word
        @index << unique.size - 1
      end
    end
  end

end

text = "This specification is the spec for a specification"
compressor = TextCompressor.new( text )

unique_word_array = compressor.unique
word_index = compressor.index

puts unique_word_array.inspect
puts word_index.inspect