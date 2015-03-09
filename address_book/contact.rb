require './phone_number'
require './address'
class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers, :addresses

  def initialize
    @phone_numbers = []
    @addresses = []  
  end

  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    @phone_numbers << phone_number
  end

  def add_address(kind, street_1, street_2, city, state, postal_code)
    address = Address.new
    address.kind = kind
    address.street_1 = street_1
    address.street_2 = street_2
    address.city = city
    address.state = state
    address.postal_code = postal_code
    @addresses << address
  end

  def first_name
    @first_name = name
  end

  def middle_name
    @middle_name = middle_name 
  end

  def last_name
    @last_name = last_name
  end

  def full_name
    full_name = @first_name + " "
    full_name += @middle_name + " " unless @middle_name.nil?
    full_name += @last_name
  end

  def first_last
    "#{@first_name} #{@last_name}"
  end

  def last_first
    full_name += @last_name + ", "
    full_name = @first_name + " "
    full_name += @middle_name unless @middle_name.nil?
  end

  def to_s(format = 'first_last')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
        last_name
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    @phone_numbers.each do |phone|
      puts phone
    end
  end

  def print_addresses
    puts "Address"
    @addresses.each do |address|
      puts address.to_s('short')
    end
  end

  def search_contact
        
  end

end
