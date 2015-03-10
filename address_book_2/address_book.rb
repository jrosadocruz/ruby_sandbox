require "./helpers"
require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def run!
    loop do
      puts "Address Book"
      puts "A: add contact"
      puts "S: search contact"
      puts "E: exit"
      print "Insert your choice: "
      choice = gets.chomp.downcase
      puts "\n"
      case choice
      when 'a'
        puts "Add new contact"
        add_contact
      when 's'
        print "Search term: "
        term = gets.chomp
        search_by_name(term)
        search_by_phone(term)
        search_by_address(term)
        puts "\n"
      else 'e'
        break
      end
    end
  end

  def add_contact
    contact = Contact.new
    print "First name: "
    contact.first_name = gets.chomp
    print "Middle name: "
    contact.middle_name = gets.chomp
    print "Last name: "
    contact.last_name = gets.chomp

    loop do
      puts "Add phone numbers or addresses"
      puts "P: add phone"
      puts "A: add address"
      print "Insert your choice: "
      selection = gets.chomp
      case selection
      when 'p'
        phone_number = PhoneNumber.new
        print "Phone number kind: "
        phone_number.kind = gets.chomp
        print "Phone number: "
        phone_number.number = gets.chomp
        contact.phone_numbers << phone_number
      when 'a'
        address = Address.new

        print "Address kind: "
        address.kind        = gets.chomp

        print "Address line 1: "
        address.street_1    = gets.chomp

        print "Address line 2: "
        address.street_2    = gets.chomp

        print "City "
        address.city        = gets.chomp

        print "State: "
        address.state       = gets.chomp

        print "Postal code: "
        address.postal_code = gets.chomp

        contact.addresses << address
        puts "\n"
      end
    end

    @contacts << contact
  end

  def print_contacts
    @contacts.each do |contact|
      puts contact.full_name
      contact.phone_numbers.each do |number|
        puts number
      end
      contact.addresses.each do |address|
        puts address
      end
      puts "\n"
    end
  end

  def search_by_name(name)
    results = []
    search = name.downcase
    @contacts.each do |contact|
      if contact.to_s('full_name').downcase.include?(search)
        results << contact unless results.include?(contact)
      end
    end

    print_results("Name search result for (#{name}):", results)
  end

  def search_by_phone(phone)
    results = []
    search = phone.gsub(/-./, "")
    @contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub(/-./, "").include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end

    print_results("Phone search result for (#{phone})", results)
  end

  def search_by_address(address)
    results = []
    search = address.downcase
    @contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end

    print_results("Address search result for (#{address})", results)
  end

  def print_results(msg, array)
    puts msg
    array.each do |contact|
      puts contact.full_name
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

end

address_book = AddressBook.new

jose = Contact.new
jose.first_name = "José"
jose.middle_name = "Ricardo"
jose.last_name = "Rosado"
jose.add_phone_number("Home", "809-555-5555")
jose.add_phone_number("Work", "829-333-3333")
jose.add_address("Home", "123 Home St", "Calle Emilio", "Santo Domingo", "D.N.", "00000")
jose.add_address("Work", "123 Work St", "Calle Work", "Santiago", "Santiago de los Caballeros", "11111")

brenda = Contact.new
brenda.first_name = "Brenda"
brenda.last_name = "Taveras"
brenda.add_phone_number("Home", "809-444-4444")
brenda.add_phone_number("Work", "829-777-7777")
brenda.add_address("Home", "456 Brenda St", "Calle Taveras", "Santo Domingo", "D.N.", "00000")

address_book.contacts << jose
address_book.contacts << brenda

address_book.run!

# address_book.search_by_name("a")
# address_book.search_by_phone("555")
# address_book.search_by_address("456")

# address_book.print_contacts