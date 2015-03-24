class BookInStock
  attr_reader :isbn
  attr_accessor :price

  def initialize isbn, price
    @isbn = isbn
    @price = price.to_f
  end

  def to_s
    "ISBN: #{@isbn}, Price: #{@price}"
  end


  # `price_in_cents` method is used to create a "virtual instance variable".
  # This means that to the outside world, price_in_cents seems to be an
  # attribute setter and getter method variable, but it's not. Its just making
  # a calculation and returning the desired value.
  def price_in_cents
    Integer( price * 100 + 0.5 ) # +0.5 Because floating-point numbers don’t always have an exact internal representation.
  end

  def price_in_cents=(cents)
    @price = cents / 100.0
  end

end

# book1 = BookInStock.new("isbn1", 3)
# puts book1

# puts book1.price_in_cents
# book1.price_in_cents = 500
# puts book1.price_in_cents
# puts book1

# # book1.price = 5
# # puts book1

# book2 = BookInStock.new("isbn2", 3.14)
# puts book2

# book3 = BookInStock.new("isbn3", "5.67")
# puts book3