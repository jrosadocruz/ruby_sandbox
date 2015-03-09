require './phone_number'
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
      puts "#{phone.kind}: #{phone.number}"
    end
  end

end

jose = Contact.new
jose.first_name = "José"
jose.middle_name = "Ricardo"
jose.last_name = "Rosado"
jose.add_phone_number('Home', '809-555-5555')

puts jose.to_s('full_name')
jose.print_phone_numbers