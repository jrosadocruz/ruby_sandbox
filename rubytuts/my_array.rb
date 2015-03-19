class MyArray
  attr_reader :array

  def initialize
    @array = []
  end

  def push(item)
    @array << item
  end

  def each(&block)
    i = 0
    while i < @array.length
      block.call(array[i])
      i += 1
    end
    array
  end

end

array = MyArray.new

array.push(0)
array.push(1)
array.push(2)
array.push(3)
puts array.inspect

array.each do |item|
  puts "This is number #{item}"
end