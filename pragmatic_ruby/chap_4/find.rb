class Array

  def find
    a = []
    each do |value|
      a << value if yield value
    end
    a
  end

end

find = [1, 3, 5, 7, 9].find { |value| (value*value) > 30 }
puts find.inspect
